# My first solved problem with code

secret = int(input("Guess the number: \n"))

if secret == 1:
    print("You guessed the number. \n Automating with Python is fun!")
else:
    print("Maybe next time...")

print(type(secret))


def comp(a):
    b = a
    while 0 < a <= b:
        print(a)
        a -= 1


comp(21)
