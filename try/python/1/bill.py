def pay_the_bill():
    bill = float(input("Whats the bill ?: \n"))
    percent = float(input("Whats the tip percent ?: \n"))
    count = float(input("Whats the count of people?: \n"))
    bill += (bill * percent) / 100

    ans = bill / count

    print("It's " + str(ans) + "$ for everyone to pay!")


pay_the_bill()


def pifagor(x, y, z):
    gipotenuza_kv = z ** 2
    katet_1 = x ** 2
    katet_2 = y ** 2
    katet_sum = katet_2 + katet_1

    if gipotenuza_kv == katet_sum:
        print("It's a Pifagor's triangle")
    else:
        print("Nooo, bad one ...")


pifagor(3, 4, 5)
