import itertools

def main():
    l = list(itertools.permutations(range(10)))
    l.sort()
    sol = l[999999]
    print(''.join(sol))


if __name__ == '__main__':
    main()
