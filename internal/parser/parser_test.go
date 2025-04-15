package parser

import "testing"

func TestReadWholeFile(t *testing.T) {
	// readWholeFile("../data/order.txt")
	readWholeFiles("../data/order.txt")

}

func TestReadLineFile(t *testing.T) {
	readLineFile("../data/order.txt")
}

func BenchmarkReadWholeFile(b *testing.B) {
	for i := 0; i < 1000; i++ {
		readWholeFile("../data/order.txt")
		//BenchmarkReadWholeFile-8   	       1	1720423400 ns/op
	}
}

func BenchmarkReadLineFile(b *testing.B) {
	for i := 0; i < 1000; i++ {
		readLineFile("../data/order.txt")
		//BenchmarkReadLineFile-8   	       1	1638304000 ns/op
	}
}
