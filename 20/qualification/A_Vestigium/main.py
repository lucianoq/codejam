from sys import stdin


def trace(matrix):
    n = len(matrix)

    s = 0
    for i in range(n):
        s += matrix[i][i]
    return s


def duplicated_rows(matrix):
    dups = 0
    for row in matrix:
        if len(row) != len(set(row)):
            dups += 1
    return dups


def duplicated_columns(matrix):
    dups = 0
    for j in range(len(matrix)):
        column = [row[j] for row in matrix]
        if len(column) != len(set(column)):
            dups += 1
    return dups


def compute(matrix):
    k = trace(matrix)
    r = duplicated_rows(matrix)
    c = duplicated_columns(matrix)
    return k, r, c


def main():
    t = int(stdin.readline().strip())

    for t_i in range(t):

        N = int(stdin.readline().strip())

        matrix = []
        for _ in range(N):
            row = [int(x) for x in stdin.readline().strip().split()]
            matrix.append(row)

        k, r, c = compute(matrix)

        print(f"Case #{t_i + 1}: {k} {r} {c}")


main()
