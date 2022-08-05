def domino_counter():
    counter = 0
    for left in range(7):
        for right in range(left, 7):
            print("[" + str(left) + "|" + str(right) + "]", end=" ")
            counter += 1
        print()
    print(counter)


domino_counter()
