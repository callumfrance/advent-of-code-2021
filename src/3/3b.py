#! /bin/usr/python3

def read_from_file(file_name: str) -> list[list[int]]:
    binary_lists = []

    with open(file_name, 'r') as f:
        num_line = list()

        while True:
            line = f.readline()
            if not line:
                break

            for c in line[:-1]:
                num_line.append(int(c))

            binary_lists.append(num_line)

    return binary_lists


def solve(binary_lists: list[list[int]], solveForMax: int):
    depth = 0
    candidates = binary_lists
    y = ''

    while len(candidates) > 1:
        partitioned = [[], []]

        for x in candidates:
            partitioned[1 if x[depth] else 0].append(x)

        if len(partitioned[0]) > len(partitioned[1]):
            candidates = partitioned[0] if solveForMax == 1 else partitioned[1]
        elif len(partitioned[0]) < len(partitioned[1]):
            candidates = partitioned[1] if solveForMax == 1 else partitioned[0]
        elif len(partitioned[0]) == len(partitioned[1]):
            candidates = partitioned[solveForMax]

        print(len(partitioned[0]), len(partitioned[1]))
        print(len(candidates))

    print(candidates)
    for x in candidates[0]:
        y = y + str(x)

    return int(y, 2)


def run(binary_lists: list[list[int]]):
    oxygen = solve(binary_lists, 0)
    carbon = solve(binary_lists, 1)
    print(oxygen)
    print(carbon)

    return oxygen * carbon


if __name__ == '__main__':
    binary_lists = read_from_file('input.txt')
    print(run(binary_lists))
