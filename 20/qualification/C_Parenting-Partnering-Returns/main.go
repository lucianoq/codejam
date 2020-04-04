package main

import (
	"bufio"
	"fmt"
	"os"
	"sort"
	"strconv"
	"strings"
)

type Task struct {
	ID    int
	Start int
	End   int
}

type ByStart []Task

func (t ByStart) Len() int {
	return len(t)
}

func (t ByStart) Less(i, j int) bool {
	return t[i].Start < t[j].Start
}

func (t ByStart) Swap(i, j int) {
	t[i], t[j] = t[j], t[i]
}

type Person struct {
	Tasks []Task
}

func (p *Person) Free(task Task) bool {
	for _, t := range p.Tasks {
		if overlap(t, task) {
			return false
		}
	}
	return true
}

func overlap(t1, t2 Task) bool {
	if t1.Start <= t2.Start {
		return t1.End > t2.Start
	} else {
		return t2.End > t1.Start
	}
}

func (p *Person) Do(task Task) {
	p.Tasks = append(p.Tasks, task)
}

func newPerson() *Person {
	return &Person{
		Tasks: make([]Task, 0),
	}
}

func main() {
	scanner := bufio.NewScanner(os.Stdin)

	scanner.Scan()
	n, _ := strconv.Atoi(scanner.Text())

	for testCase := 0; testCase < n; testCase++ {
		scanner.Scan()
		numTasks, _ := strconv.Atoi(scanner.Text())

		tasks := make([]Task, 0)

		for t := 0; t < numTasks; t++ {
			scanner.Scan()
			list := strings.Split(scanner.Text(), " ")
			start, _ := strconv.Atoi(list[0])
			stop, _ := strconv.Atoi(list[1])
			tasks = append(tasks, Task{t, start, stop})
		}

		fmt.Printf("Case #%d: %s\n", testCase+1, schedule(tasks))
	}
}

func schedule(tasks []Task) string {
	cameron := newPerson()
	jamie := newPerson()

	sort.Sort(ByStart(tasks))

	for _, t := range tasks {
		if cameron.Free(t) {
			cameron.Do(t)
			continue
		}

		if jamie.Free(t) {
			jamie.Do(t)
			continue
		}

		return "IMPOSSIBLE"
	}

	result := make([]string, len(tasks))

	for _, t := range cameron.Tasks {
		result[t.ID] = "C"
	}
	for _, t := range jamie.Tasks {
		result[t.ID] = "J"
	}

	return strings.Join(result, "")
}
