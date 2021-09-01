def read():
    return (int(x) for x in input().split(" "))


def write(primes):
    print(" ".join(str(p) for p in primes))


def primes_between(lower_bound, upper_bound):
    return [
        n
        for n in range(lower_bound, upper_bound)
        if is_prime(n)
    ]


def is_prime(x):
    # corner cases
    if x < 2:
        return False
    elif x == 2:
        return True

    # regular cases
    n = 2
    while n <= x**0.5:
        if x % n == 0:
            return False
        n += 1
    return True


def main():
    lower_bound, upper_bound = read()
    primes = primes_between(lower_bound, upper_bound)
    write(primes)


if __name__ == '__main__':
    main()
