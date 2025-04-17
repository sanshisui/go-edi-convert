package main

import (
	"encoding/json"
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
	Name string
	Type string
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
	data, err := os.ReadFile("./internal/data/order.xsd")
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
			ct1 := complexTypeMap[se.Name]
			name1 := ct1.Sequence.Elements[0].Name
			var nodeChilds1 []TreeNode
			for i := 1; i < len(ct1.Sequence.Elements); i++ {
				if strings.HasPrefix(ct1.Sequence.Elements[i].Name, "GROUP") {
					ct2 := complexTypeMap[ct1.Sequence.Elements[i].Name]
					name2 := ct2.Sequence.Elements[0].Name
					var nodeChilds2 []TreeNode
					for j := 1; j < len(ct2.Sequence.Elements); j++ {
						if strings.HasPrefix(ct2.Sequence.Elements[j].Name, "GROUP") {
							ct3 := complexTypeMap[ct2.Sequence.Elements[j].Name]
							name3 := ct3.Sequence.Elements[0].Name
							var nodeChilds3 []TreeNode
							for k := 1; k < len(ct3.Sequence.Elements); k++ {
								nodeChilds3 = append(nodeChilds3, TreeNode{Name: ct3.Sequence.Elements[k].Name, Type: getNodeType(ct3.Sequence.Elements[k].MinOccurs, ct3.Sequence.Elements[k].MaxOccurs)})
							}
							nodeChilds2 = append(nodeChilds2, TreeNode{Name: name3, Type: getNodeType(ct2.Sequence.Elements[j].MinOccurs, ct2.Sequence.Elements[j].MaxOccurs), Children: nodeChilds3})
							continue
						}
						nodeChilds2 = append(nodeChilds2, TreeNode{Name: ct2.Sequence.Elements[j].Name, Type: getNodeType(ct2.Sequence.Elements[j].MinOccurs, ct2.Sequence.Elements[j].MaxOccurs)})
						continue
					}
					nodeChilds1 = append(nodeChilds1, TreeNode{Name: name2, Type: getNodeType(ct1.Sequence.Elements[i].MinOccurs, ct1.Sequence.Elements[i].MaxOccurs), Children: nodeChilds2})
					continue
				}
				nodeChilds1 = append(nodeChilds1, TreeNode{Name: ct1.Sequence.Elements[i].Name, Type: getNodeType(ct1.Sequence.Elements[i].MinOccurs, ct1.Sequence.Elements[i].MaxOccurs)})
				continue
			}
			nodes = append(nodes, TreeNode{Name: name1, Type: getNodeType(se.MinOccurs, se.MaxOccurs), Children: nodeChilds1})
			continue
		}
		nodes = append(nodes, TreeNode{Name: se.Name, Type: getNodeType(se.MinOccurs, se.MaxOccurs), Children: nil})
	}
	//log.Println(nodes)
	// log.Println(nodes)
	// jsonBytes, err := json.MarshalIndent(nodes, "", "  ")
	// if err != nil {
	// 	log.Fatal("序列化为JSON失败:", err)
	// }
	// log.Println(string(jsonBytes))


	data1, err := os.ReadFile("./internal/data/order.txt")
	if err != nil {
		log.Fatal(err)
	}

	// 去除所有换行符（Windows、Unix和Mac）
	content := string(data1)
	content = strings.ReplaceAll(content, "\r\n", "") // Windows换行
	content = strings.ReplaceAll(content, "\r", "")   // Mac换行
	content = strings.ReplaceAll(content, "\n", "")   // Unix换行

	log.Println("读取的数据内容为:", content)

	segment := strings.Split(content, "'")
	i := 0
	p := 0
	results := map[string]interface{}{}
	for _, b := range segment {
		if len(b) == 0 || strings.HasPrefix(b, "UNA") || strings.HasPrefix(b, "UNB") {
			continue
		}
		// if strings.HasPrefix(b, "UNB") {
		// 	unb := strings.Split(b, "+")
		// 	log.Println(len(unb))
		// 	log.Println(unb)
		// 	break
		// }
		for true {
			if strings.HasPrefix(b, nodes[i].Name) {
				log.Println(nodes[i].Name, b[:3])
				if nodes[i].Type == "Object"  {
					se := strings.Split(b, "+")
					obj := map[string]interface{}{}
					for m := 1; m < len(se); m++  {
						if strings.Contains(se[m], ":") {
							smc := strings.Split(se[m], ":")
							objc := map[string]interface{}{}
							for l := 0; l < len(smc); l++  {
								objc[se[0] + string(rune(m)) + string(rune(l + 1))] = smc[l]
							}
							obj[se[0] + string(rune(m))] = objc
							continue
						}
						obj[se[0] + string(rune(m))] = se[m]
					}
					results[nodes[i].Name] = obj
					i++
					break
				}else {
					se := strings.Split(b, "+")
					obj := map[string]interface{}{}
					for m := 1; m < len(se); m++  {
						if strings.Contains(se[m], ":") && !strings.Contains(se[m], "?:") {
							smc := strings.Split(se[m], ":")
							objc := map[string]interface{}{}
							for l := 0; l < len(smc); l++  {
								objc[se[0] + string(rune(m)) + string(rune(l + 1))] = smc[l]
							}
							obj[se[0] + string(rune(m))] = objc
							continue
						}
						
						obj[se[0] + string(rune(m))] = se[m]
					}
					//results[nodes[i].Name] = append(results[nodes[i].Name].([]interface{}), obj)
					if arr, ok := results[nodes[i].Name].([]interface{}); ok {
						results[nodes[i].Name] = append(arr, obj)
					} else {
						results[nodes[i].Name] = []interface{}{obj}
					}
					break
				}
			}else if nodes[i].Children != nil && strings.HasPrefix(b, nodes[i].Children[p].Name) {
				
			} else {
				i++
			}
		}


		
		
	}

	// log.Println("i的值", i)
		// 输出最终JSON
	jsonBytes, err := json.MarshalIndent(results, "", "  ")
	if err != nil {
		log.Fatal("序列化为JSON失败:", err)
	}
	log.Println(string(jsonBytes))



}

func getNodeType(minOccurs, maxOccurs string) string {
	if (minOccurs == "" && maxOccurs == "") || (minOccurs == "0" && maxOccurs == "") {
		return "Object"
	}
	return "Array"
}
