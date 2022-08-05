def votes(params):
    for vote in params:
        print(vote, end="\n\n")
        for v in vote:
            print(v)


votes(["Maybe Yes", "Maybe No", "Maybe sex"])
