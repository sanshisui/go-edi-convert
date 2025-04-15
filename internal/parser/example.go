package parser

import (
	"fmt"
	"log"
	"os"
	"strings"
)

func readWholeFiles(path string) {
	data, err := os.ReadFile(path)
	if err != nil {
		log.Fatal(err)
	}

	// 去除所有换行符（Windows、Unix和Mac）
	content := string(data)
	content = strings.ReplaceAll(content, "\r\n", "") // Windows换行
	content = strings.ReplaceAll(content, "\r", "")   // Mac换行
	content = strings.ReplaceAll(content, "\n", "")   // Unix换行

	fmt.Println("读取的数据内容为:", content)

	// 解析EDI文件结构
	parseEDIFile(content)
}

// 解析EDI文件结构
func parseEDIFile(content string) {
	segments := strings.Split(content, "'")

	// 创建EDI文档结构
	ediDocument := make(map[string]interface{})

	// 当前消息
	var currentMessage map[string]interface{}
	// 当前分组
	var currentGroup map[string]interface{}
	// 当前分组中的段列表
	var currentSegmentList []map[string]interface{}

	// 跟踪当前处理的状态
	inMessage := false
	inGroup := false
	currentGroupType := ""

	for _, segmentStr := range segments {
		if len(segmentStr) == 0 {
			continue
		}

		// 解析段
		segment := parseSegment(segmentStr)
		segmentType := segment["SegmentType"].(string)

		// 根据段类型处理
		switch {
		case segmentType == "UNA" || segmentType == "UNB":
			// 交换控制头 - 对象类型
			ediDocument[segmentType] = segment

		case segmentType == "UNH":
			// 消息头 - 开始新消息
			inMessage = true
			currentMessage = make(map[string]interface{})
			currentMessage["Header"] = segment
			currentMessage["Segments"] = make([]map[string]interface{}, 0)

		case segmentType == "UNT":
			// 消息尾 - 结束当前消息
			if inMessage {
				currentMessage["Trailer"] = segment

				// 如果消息列表不存在，创建它
				if _, exists := ediDocument["Messages"]; !exists {
					ediDocument["Messages"] = make([]map[string]interface{}, 0)
				}

				// 添加完成的消息到消息列表
				messages := ediDocument["Messages"].([]map[string]interface{})
				ediDocument["Messages"] = append(messages, currentMessage)

				inMessage = false
			}

		case segmentType == "UNS":
			// 分段控制 - 通常表示从标题部分到明细部分的转换
			if inMessage {
				currentMessage["Segments"] = append(currentMessage["Segments"].([]map[string]interface{}), segment)
			}

		case isGroupStart(segmentType):
			// 分组开始 - 例如NAD、LIN等可能开始一个分组
			if inMessage {
				inGroup = true
				currentGroupType = segmentType
				currentGroup = make(map[string]interface{})
				currentGroup["Header"] = segment
				currentSegmentList = make([]map[string]interface{}, 0)
			}

		case isGroupEnd(segmentType, currentGroupType):
			// 分组结束
			if inGroup {
				currentGroup["Segments"] = currentSegmentList

				// 将分组添加到消息中
				// 检查该类型的分组列表是否存在
				groupKey := currentGroupType + "Groups"
				if _, exists := currentMessage[groupKey]; !exists {
					currentMessage[groupKey] = make([]map[string]interface{}, 0)
				}

				groups := currentMessage[groupKey].([]map[string]interface{})
				currentMessage[groupKey] = append(groups, currentGroup)

				inGroup = false
				currentGroupType = ""
			}

		default:
			// 普通段
			if inGroup {
				// 添加到当前分组
				currentSegmentList = append(currentSegmentList, segment)
			} else if inMessage {
				// 添加到当前消息
				currentMessage["Segments"] = append(currentMessage["Segments"].([]map[string]interface{}), segment)
			} else {
				// 添加到文档级别
				if _, exists := ediDocument["OtherSegments"]; !exists {
					ediDocument["OtherSegments"] = make([]map[string]interface{}, 0)
				}
				otherSegments := ediDocument["OtherSegments"].([]map[string]interface{})
				ediDocument["OtherSegments"] = append(otherSegments, segment)
			}
		}
	}

	// 输出解析结果
	fmt.Println("EDI文档结构:")
	printEDIStructure(ediDocument, 0)
}

// 解析单个段
func parseSegment(segment string) map[string]interface{} {
	result := make(map[string]interface{})

	// 获取段类型
	segmentType := ""
	if len(segment) >= 3 {
		segmentType = segment[:3]
	} else {
		segmentType = segment
	}

	// 分割数据元素
	elements := strings.Split(segment, "+")

	// 第一个元素通常是段标识符
	result["SegmentType"] = segmentType

	// 处理其余数据元素
	for i, element := range elements {
		if i == 0 {
			continue // 跳过段标识符
		}

		// 检查是否有组件
		if strings.Contains(element, ":") {
			// 有组件的情况，作为对象处理
			components := strings.Split(element, ":")
			componentMap := make(map[string]string)

			for j, component := range components {
				componentMap[fmt.Sprintf("Component_%d", j+1)] = component
			}

			result[fmt.Sprintf("Element_%d", i)] = componentMap
		} else {
			// 无组件的情况，作为简单值处理
			result[fmt.Sprintf("Element_%d", i)] = element
		}
	}

	return result
}

// 判断是否是分组开始段
func isGroupStart(segmentType string) bool {
	// 这里需要根据具体的EDI标准来定义哪些段可以开始一个分组
	// 以下是一些常见的例子，需要根据实际情况调整
	groupStartSegments := map[string]bool{
		"NAD": true, // 名称和地址
		"LIN": true, // 行项目
		"CTA": true, // 联系信息
		"RFF": true, // 参考
		// 添加更多...
	}

	return groupStartSegments[segmentType]
}

// 判断是否是分组结束段
func isGroupEnd(segmentType string, currentGroupType string) bool {
	// 这里需要根据具体的EDI标准来定义哪些段可以结束一个分组
	// 通常，下一个分组的开始或特定的控制段可以表示当前分组的结束

	// 简化的实现：如果遇到另一个可能开始分组的段，则认为当前分组结束
	if currentGroupType != "" && currentGroupType != segmentType && isGroupStart(segmentType) {
		return true
	}

	// 特定的结束段
	endSegments := map[string]bool{
		"UNS": true,
		"UNT": true,
		// 添加更多...
	}

	return endSegments[segmentType]
}

// 打印EDI结构（用于调试）
func printEDIStructure(structure interface{}, indent int) {
	indentStr := strings.Repeat("  ", indent)

	switch v := structure.(type) {
	case map[string]interface{}:
		for key, value := range v {
			fmt.Printf("%s%s: ", indentStr, key)

			switch val := value.(type) {
			case map[string]interface{}, []map[string]interface{}:
				fmt.Println()
				printEDIStructure(val, indent+1)
			default:
				fmt.Println(val)
			}
		}

	case []map[string]interface{}:
		for i, item := range v {
			fmt.Printf("%s[%d]:\n", indentStr, i)
			printEDIStructure(item, indent+1)
		}

	default:
		fmt.Printf("%s%v\n", indentStr, v)
	}
}