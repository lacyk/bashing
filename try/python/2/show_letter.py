def func(word):
    for letter in word:
        if letter == 's':
            continue
        print("Letter: %s" % letter)


func("Professional")
