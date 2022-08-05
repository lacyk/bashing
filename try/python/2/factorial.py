def fact(x):
    print("Before looping: %s" % x)
    if x < 2:
        return 1
    result = x * fact(x-1)
    print(result)
    return result


print(fact(4))
