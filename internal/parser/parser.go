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

	fmt.Println("读取的数据内容为:", string(data))
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

		if strings.HasPrefix(line, "UNA") {

		}
		fmt.Println("读取到的数据为:", line)
	}
}
