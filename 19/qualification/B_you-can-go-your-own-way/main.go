package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func main() {
	scanner := bufio.NewScanner(os.Stdin)

	scanner.Scan()
	numTests, _ := strconv.Atoi(scanner.Text())

	for i := 0; i < numTests; i++ {
		scanner.Scan()
		n, _ := strconv.Atoi(scanner.Text())

		scanner.Scan()
		p := scanner.Text()

		path := solution(n, p)

		_, _ = fmt.Printf("Case #%d: %s\n", i+1, path)
	}
}

func solution(_ int, p string) string {
	p = strings.Replace(p, "S", "e", -1)
	p = strings.Replace(p, "E", "s", -1)
	return strings.ToUpper(p)
}
