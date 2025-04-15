package main

import (
	"encoding/xml"
	"fmt"
	"os"
)

type Schema struct {
	XMLName      xml.Name      `xml:"schema"`
	Elements     []Element     `xml:"element"`
	ComplexTypes []ComplexType `xml:"complexType"`
}

type Element struct {
	Name        string       `xml:"name,attr"`
	Type        string       `xml:"type,attr"`
	MinOccurs   string       `xml:"minOccurs,attr,omitempty"`
	MaxOccurs   string       `xml:"maxOccurs,attr,omitempty"`
	Sequence    *Sequence    `xml:"sequence,omitempty"`
	Annotation  *Annotation  `xml:"annotation,omitempty"`
	ComplexType *ComplexType `xml:"complexType,omitempty"` // 内联复杂类型定义
}

type ComplexType struct {
	Name       string      `xml:"name,attr"`
	Sequence   *Sequence   `xml:"sequence,omitempty"`
	Annotation *Annotation `xml:"annotation,omitempty"`
}

type Sequence struct {
	MinOccurs string     `xml:"minOccurs,attr,omitempty"`
	MaxOccurs string     `xml:"maxOccurs,attr,omitempty"`
	Elements  []Element  `xml:"element"`
	Sequences []Sequence `xml:"sequence,omitempty"` // 嵌套序列
}

type Annotation struct {
	AppInfo       string `xml:"appinfo"`
	Documentation string `xml:"documentation"`
}

func main() {
	data, err := os.ReadFile("./internal/data/order.xsd")
	if err != nil {
		fmt.Printf("读取文件错误: %v\n", err)
		return
	}

	var schema Schema
	err = xml.Unmarshal(data, &schema)
	if err != nil {
		fmt.Printf("解析XML错误: %v\n", err)
		return
	}

	// 打印顶层元素
	fmt.Println("顶层元素:")
	for _, elem := range schema.Elements {
		fmt.Printf("元素名: %s, 类型: %s\n", elem.Name, elem.Type)
		if elem.MinOccurs != "" || elem.MaxOccurs != "" {
			fmt.Printf("  出现次数: 最小=%s, 最大=%s\n",
				getDefaultIfEmpty(elem.MinOccurs, "1"),
				getDefaultIfEmpty(elem.MaxOccurs, "1"))
		}

		if elem.Annotation != nil {
			printAnnotation(elem.Annotation, "  ")
		}
	}

	// 打印复杂类型
	fmt.Println("\n复杂类型:")
	for _, complexType := range schema.ComplexTypes {
		fmt.Printf("复杂类型名: %s\n", complexType.Name)

		if complexType.Annotation != nil {
			printAnnotation(complexType.Annotation, "  ")
		}

		if complexType.Sequence != nil {
			printSequence(complexType.Sequence, "  ")
		}
		fmt.Println()
	}
}

// 打印注释信息
func printAnnotation(annotation *Annotation, indent string) {
	if annotation.AppInfo != "" {
		fmt.Printf("%s应用信息: %s\n", indent, annotation.AppInfo)
	}
	if annotation.Documentation != "" {
		fmt.Printf("%s文档说明: %s\n", indent, annotation.Documentation)
	}
}

// 打印序列信息
func printSequence(sequence *Sequence, indent string) {
	minOccurs := getDefaultIfEmpty(sequence.MinOccurs, "1")
	maxOccurs := getDefaultIfEmpty(sequence.MaxOccurs, "1")

	fmt.Printf("%s序列出现次数: 最小=%s, 最大=%s\n", indent, minOccurs, maxOccurs)
	fmt.Printf("%s包含的元素:\n", indent)

	for _, elem := range sequence.Elements {
		elemMinOccurs := getDefaultIfEmpty(elem.MinOccurs, "1")
		elemMaxOccurs := getDefaultIfEmpty(elem.MaxOccurs, "1")

		fmt.Printf("%s  - 元素名: %s, 类型: %s, 最小出现: %s, 最大出现: %s\n",
			indent, elem.Name, elem.Type, elemMinOccurs, elemMaxOccurs)

		if elem.Annotation != nil {
			printAnnotation(elem.Annotation, indent+"    ")
		}

		if elem.Sequence != nil {
			printSequence(elem.Sequence, indent+"    ")
		}

		if elem.ComplexType != nil {
			fmt.Printf("%s    内联复杂类型:\n", indent)
			if elem.ComplexType.Sequence != nil {
				printSequence(elem.ComplexType.Sequence, indent+"      ")
			}
		}
	}

	// 处理嵌套序列
	if len(sequence.Sequences) > 0 {
		fmt.Printf("%s嵌套序列:\n", indent)
		for i, nestedSeq := range sequence.Sequences {
			fmt.Printf("%s  嵌套序列 #%d:\n", indent, i+1)
			printSequence(&nestedSeq, indent+"    ")
		}
	}
}

// 获取默认值（如果为空）
func getDefaultIfEmpty(value, defaultValue string) string {
	if value == "" {
		return defaultValue
	}
	return value
}
