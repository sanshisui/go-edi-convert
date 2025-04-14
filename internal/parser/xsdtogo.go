package parser

import (
	"encoding/xml"
	"fmt"
	"io/ioutil"
	"os"
	"strings"
)

type XSDSchema struct {
	XMLName         xml.Name         `xml:"schema"`
	ComplexTypes    []ComplexType    `xml:"complexType"`
	Elements        []Element        `xml:"element"`
}

type ComplexType struct {
	Name        string        `xml:"name,attr"`
	Sequence    Sequence      `xml:"sequence"`
	Annotation  Annotation    `xml:"annotation"`
}

type Sequence struct {
	Elements []Element `xml:"element"`
}

type Element struct {
	Name     string `xml:"name,attr"`
	Type     string `xml:"type,attr"`
	MinOccurs string `xml:"minOccurs,attr"`
	MaxOccurs string `xml:"maxOccurs,attr"`
}

type Annotation struct {
	Documentation string `xml:"documentation"`
}

func readUrl(url string) {
	// 读取XSD文件
	xsdData, err := ioutil.ReadFile(url)
	if err != nil {
		fmt.Printf("读取XSD文件失败: %v\n", err)
		return
	}

	var schema XSDSchema
	err = xml.Unmarshal(xsdData, &schema)
	if err != nil {
		fmt.Printf("解析XSD失败: %v\n", err)
		return
	}

	// 创建输出文件
	outputFile, err := os.Create("d:\\Project\\project\\AS400\\go-edi-convert\\internal\\model\\order.go")
	if err != nil {
		fmt.Printf("创建输出文件失败: %v\n", err)
		return
	}
	defer outputFile.Close()

	// 写入文件头部
	header := `package model

import "encoding/xml"

`
	outputFile.WriteString(header)

	// 生成复杂类型结构体
	for _, ct := range schema.ComplexTypes {
		if ct.Name == "" {
			continue
		}

		// 结构体注释
		if ct.Annotation.Documentation != "" {
			outputFile.WriteString(fmt.Sprintf("// %s %s\n", ct.Name, ct.Annotation.Documentation))
		}

		// 结构体定义
		outputFile.WriteString(fmt.Sprintf("type %s struct {\n", ct.Name))
		outputFile.WriteString("    XMLName xml.Name `xml:\"" + ct.Name + "\"`\n")

		// 生成字段
		for _, elem := range ct.Sequence.Elements {
			fieldType := elem.Type
			if strings.Contains(elem.Type, ":") {
				fieldType = strings.Split(elem.Type, ":")[1]
			}

			// 处理数组类型
			if elem.MaxOccurs == "unbounded" || (elem.MaxOccurs != "" && elem.MaxOccurs != "1") {
				fieldType = "[]" + fieldType
			}

			// 处理可选字段
			tag := ""
			if elem.MinOccurs == "0" {
				tag = fmt.Sprintf(" `xml:\"%s,omitempty\"`", elem.Name)
			} else {
				tag = fmt.Sprintf(" `xml:\"%s\"`", elem.Name)
			}

			outputFile.WriteString(fmt.Sprintf("    %s %s%s\n", elem.Name, fieldType, tag))
		}

		outputFile.WriteString("}\n\n")
	}

	// 生成顶级元素
	for _, elem := range schema.Elements {
		if elem.Type == "" {
			continue
		}

		fieldType := elem.Type
		if strings.Contains(elem.Type, ":") {
			fieldType = strings.Split(elem.Type, ":")[1]
		}

		outputFile.WriteString(fmt.Sprintf("type %s struct {\n", elem.Name))
		outputFile.WriteString("    XMLName xml.Name `xml:\"" + elem.Name + "\"`\n")
		outputFile.WriteString(fmt.Sprintf("    Content %s `xml:\",innerxml\"`\n", fieldType))
		outputFile.WriteString("}\n\n")
	}

	fmt.Println("结构体生成完成")
}