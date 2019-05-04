package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
)

func main() {
	scanner := bufio.NewScanner(os.Stdin)

	scanner.Scan()
	T, _ := strconv.Atoi(scanner.Text())

	for i := 0; i < T; i++ {
		scanner.Scan()
		A, _ := strconv.Atoi(scanner.Text())
		C := make([]string, A)
		for j := 0; j < A; j++ {
			scanner.Scan()
			C[j] = scanner.Text()
		}
		res, possible := solution(C)
		if !possible {
			_, _ = fmt.Printf("Case #%d: IMPOSSIBLE\n", i+1)
			continue
		}

		_, _ = fmt.Printf("Case #%d: %s\n", i+1, res)
	}
}

func solution(C []string) (string, bool) {
	solString := ""

	for i := 0; i < 10^100; i++ {
		set := make(map[string]bool)
		for _, opponentProgram := range C {
			move := opponentProgram[i%len(opponentProgram)]
			set[string(move)] = true
		}
		if set["R"] && set["P"] && set["S"] {
			return "", false
		}
		if set["R"] && set["P"] {
			solString += "P"
			C = cleanSlice(i, "R", C)
			continue
		}
		if set["R"] && set["S"] {
			solString += "R"
			C = cleanSlice(i, "S", C)
			continue
		}
		if set["P"] && set["S"] {
			solString += "S"
			C = cleanSlice(i, "P", C)
			continue
		}
		if set["R"] {
			solString += "P"
			return solString, true
		}
		if set["P"] {
			solString += "S"
			return solString, true
		}
		if set["S"] {
			solString += "R"
			return solString, true
		}
	}

	return "", false
}

func cleanSlice(i int, move string, input []string) []string {
	output := make([]string, 0, len(input)/2)
	for _, opp := range input {
		if string(opp[i%len(opp)]) != move {
			output = append(output, opp)
		}
	}
	return output
}
