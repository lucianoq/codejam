package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func main() {
	input := bufio.NewScanner(os.Stdin)

	input.Scan()
	t, _ := strconv.Atoi(strings.TrimSpace(input.Text()))

	for tCase := 1; tCase <= t; tCase++ {

		input.Scan()
		arr := strings.Split(input.Text(), " ")

		x, _ := strconv.Atoi(arr[0])
		y, _ := strconv.Atoi(arr[1])
		dir := arr[2]

		res := solve(x, y, dir)

		if res == -1 {
			fmt.Printf("Case #%d: IMPOSSIBLE\n", tCase)
		} else {
			fmt.Printf("Case #%d: %d\n", tCase, res)
		}
	}
}

func solve(x, y int, dir string) int {
	for m := 0; ; m++ {
		manhattan := abs(x) + abs(y)
		if manhattan <= m {
			return m
		}

		if m >= len(dir) {
			return -1
		}

		switch dir[m] {
		case 'N':
			y++
		case 'S':
			y--
		case 'W':
			x--
		case 'E':
			x++
		}
	}
}

func abs(x int) int {
	if x < 0 {
		return -x
	}
	return x
}
