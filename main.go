package main

import (
	"encoding/xml"
	"log"
	"os"
	"strings"
)

type TreeNode struct {
	Name     string
	Type     string
	Children []TreeNode
}

type TreeNodeChild struct {
	Name     string
	Type     string
}

// XSD 结构体定义
type XSDSchema struct {
	XMLName      xml.Name         `xml:"schema"`
	Elements     []XSDElement     `xml:"element"`
	ComplexTypes []XSDComplexType `xml:"complexType"`
}

type XSDElement struct {
	Name      string `xml:"name,attr"`
	Type      string `xml:"type,attr"`
	MinOccurs string `xml:"minOccurs,attr"`
	MaxOccurs string `xml:"maxOccurs,attr"`
	// 递归子节点
	ComplexType *XSDComplexType `xml:"complexType"`
	Sequence    *XSDSequence    `xml:"sequence"`
}

type XSDComplexType struct {
	Name     string       `xml:"name,attr"`
	Sequence *XSDSequence `xml:"sequence"`
}

type XSDSequence struct {
	Elements  []XSDElement  `xml:"element"`
	Sequences []XSDSequence `xml:"sequence"`
}

func main() {
	data, err := os.ReadFile("./internal/data/order1.xsd")
	if err != nil {
		log.Fatal("读取xsd文件出现了异常", err)
	}

	var schema XSDSchema
	err = xml.Unmarshal(data, &schema)
	if err != nil {
		log.Fatal("解析xsd文件出现了异常", err)
	}

	log.Println(schema.ComplexTypes)

	if len(schema.Elements) == 0 {
		log.Fatal("没有找到根节点")
	}

	rootElem := schema.Elements[0]
	log.Println(rootElem)

	// 定义复合类型
	complexTypeMap := make(map[string]XSDComplexType)
	for _, ct := range schema.ComplexTypes {
		complexTypeMap[ct.Name] = ct
	}

	ct := schema.ComplexTypes[1]
	//log.Println(ct.Sequence.Elements)
	var nodes []TreeNode
	for _, se := range ct.Sequence.Elements {
		//log.Println(se)
		if strings.HasPrefix(se.Name, "GROUP") {
			ct := complexTypeMap[se.Name]
			name := ct.Sequence.Elements[0].Name
			var nodeChilds []TreeNode
			for i := 1; i < len(ct.Sequence.Elements); i++ {

				if strings.HasPrefix(ct.Sequence.Elements[i].Name, "GROUP") {
					ct1 := complexTypeMap[ct.Sequence.Elements[i].Name]
					name := ct.Sequence.Elements[0].Name
					var nodeChilds []TreeNode
					for j := 1; j < len(ct1.Sequence.Elements); j++ {
						if strings.HasPrefix(ct.Sequence.Elements[j].Name, "GROUP") {
							ct := complexTypeMap[ct.Sequence.Elements[j].Name]
							name := ct.Sequence.Elements[0].Name
							var nodeChilds []TreeNode
							for k := 1; k < len(ct.Sequence.Elements); k++ {
								nodeChilds = append(nodeChilds, TreeNode{Name: name, Type: getNodeType(ct.Sequence.Elements[k].MinOccurs, ct.Sequence.Elements[k].MaxOccurs)})
							}
						}
					}
					nodes = append(nodes, TreeNode{Name: name, Type: getNodeType(ct.Sequence.Elements[i].MinOccurs, ct.Sequence.Elements[i].MaxOccurs), Children: nodeChilds})
				}

				nodeChilds = append(nodeChilds, TreeNode{Name: ct.Sequence.Elements[i].Name, Type: getNodeType(ct.Sequence.Elements[i].MinOccurs, ct.Sequence.Elements[i].MaxOccurs)})
			}
			nodes = append(nodes, TreeNode{Name: name, Type: getNodeType(se.MinOccurs, se.MaxOccurs), Children: nodeChilds})
			continue
		}


		
		nodes = append(nodes, TreeNode{Name: se.Name, Type: getNodeType(se.MinOccurs, se.MaxOccurs), Children: nil})

	}





	log.Println(nodes)

	
}





func getNodeType(minOccurs, maxOccurs string) string {
	if (minOccurs == "" && maxOccurs == "") || (minOccurs == "0" && maxOccurs == "") {
		return "Object"
	}
	return "Array"
}
