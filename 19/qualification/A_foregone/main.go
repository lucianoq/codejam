package main

import (
	"bufio"
	"fmt"
	"math"
	"os"
	"strconv"
)

func main() {
	scanner := bufio.NewScanner(os.Stdin)

	scanner.Scan()
	numTests, _ := strconv.Atoi(scanner.Text())

	for i := 0; i < numTests; i++ {
		scanner.Scan()
		num, _ := strconv.Atoi(scanner.Text())
		a, b := solution(num)

		_, _ = fmt.Printf("Case #%d: %d %d\n", i+1, a, b)
	}
}

func solution(num int) (int, int) {
	a, b := num, 0
	numStr := strconv.Itoa(num)
	for i := 0; i < len(numStr); i++ {
		if string(numStr[i]) == "4" {
			x := int(math.Pow10(len(numStr) - i - 1))
			a -= x
			b += x
		}
	}
	return a, b
}
