def usr_hint(username):
    if 3 < len(username) < 15:
        print("Your username is " + username + " now! And you're a part of out team")
    else:
        print("Username should be 3-15 characters length, try again!")


inp = str(input())
usr_hint(inp)
