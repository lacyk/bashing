def func(n, counter=0):
    while n > 1:
        n = n / 10
        counter += 1
    else:
        return counter


print(func(3123431242212))
