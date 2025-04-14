package parser

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"strings"
)

/*
*
解析EDI文件
1.读取本地文件
2.解决换行符
*/

func readWholeFile(path string) {
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

	segment := strings.Split(content, "'")
	for a, b := range segment {
		if len(b) == 0 || strings.HasPrefix(b, "UNA") {
			continue
		}
		if strings.HasPrefix(b, "UNB") {
			unb := strings.Split(b, "+")
			fmt.Println(len(unb))
			fmt.Println(unb)
			break
		}
		fmt.Println(a, b)
	}
}

func readLineFile(path string) {
	file, err := os.Open(path)
	if err != nil {
		log.Fatal("读取数据出现了异常", err)
	}
	defer func(file *os.File) {
		_ = file.Close()
	}(file)

	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		line := scanner.Text()
		//过滤长度为0的数据
		if len(line) == 0 {
			continue
		}

		//if strings.HasPrefix(line, "UNA") {
		//	fmt.Println("读取到了以UNA开头的数据")
		//}

		stringArrange := strings.Split(line, "'")

		fmt.Println("分割后的字符串数组", stringArrange)

		//fmt.Println("读取到的数据为:", line)
	}
}
