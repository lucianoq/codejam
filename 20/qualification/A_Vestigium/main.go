package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"strconv"
	"strings"
)

func main() {
	input := bufio.NewScanner(os.Stdin)

	t := readInt(input)
	for tCase := 0; tCase < t; tCase++ {
		n := readInt(input)

		matrix := make([][]int, n)
		for r := 0; r < n; r++ {
			matrix[r] = readRow(input)
		}

		k, r, c := compute(matrix, n)

		fmt.Printf("Case #%d: %d %d %d\n", tCase+1, k, r, c)
	}
}

func compute(matrix [][]int, n int) (int, int, int) {

	// trace
	var k int
	for i := 0; i < n; i++ {
		k += int(matrix[i][i])
	}

	// count dup rows
	var r int
	for i := 0; i < n; i++ {
		m := make(map[int]struct{})
		for j := 0; j < n; j++ {
			m[matrix[i][j]] = struct{}{}
		}

		if len(m) != n {
			r++
		}
	}

	// count dup cols
	var c int
	for j := 0; j < n; j++ {
		m := make(map[int]struct{})
		for i := 0; i < n; i++ {
			m[matrix[i][j]] = struct{}{}
		}

		if len(m) != n {
			c++
		}
	}

	return k, r, c
}

func readInt(input *bufio.Scanner) int {
	input.Scan()
	n, err := strconv.Atoi(strings.TrimSpace(input.Text()))
	if err != nil {
		log.Fatal(err)
	}
	return n
}

func readRow(input *bufio.Scanner) []int {
	input.Scan()
	line := strings.TrimSpace(input.Text())
	sList := strings.Split(line, " ")

	intList := make([]int, len(sList))
	for i := range sList {
		n, err := strconv.Atoi(sList[i])
		if err != nil {
			log.Fatal(err)
		}
		intList[i] = n
	}
	return intList
}
