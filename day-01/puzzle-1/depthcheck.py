def checkDepth(depths):
    last = None
    increases = 0
    decreases = 0
    for depth in depths:
        num = int(depth)
        if last == None:
            last = num
        if last > num:
            decreases = decreases + 1
        if last < num:
            increases = increases + 1
        last = num

    print(f'{increases} increases')
    print(f'{decreases} decreases')


def main():
    with open('input.txt') as file:
        depths = file.readlines()
        checkDepth(depths=depths)


if __name__ == "__main__":
    main()
