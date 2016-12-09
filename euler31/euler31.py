from types import *

coins = set([1, 2, 5, 10, 20, 50, 100, 200])
min_coins = min(coins)
max_coins = max(coins)

known_results = {}


def memoize(f):
    cache = {}

    def memoizedFunction(*args):
        if args not in cache:
            cache[args] = f(*args)
        return cache[args]

    memoizedFunction.cache = cache
    return memoizedFunction


@memoize
def res(total):
    assert type(total) is IntType, "total is not an integer: %r" % total
    results = set()
    if total == 0:
        return frozenset(results)
    if total in coins:
        results.add(frozenset([total]))
    possible_coins = (coin for coin in coins if coin < total)
    for c in possible_coins:
        sol = set(res(total - c))
        for s in sol:
            ss = set(s)
            results.add(frozenset(ss.add(c)))
    r = frozenset(results)
    return r


def main():
    print res(3)


if __name__ == '__main__':
    main()
