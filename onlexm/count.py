# begin = open('/Users/vlv/Desktop/begin.txt','r')

# print(begin)

# with open('/Users/vlv/Desktop/begin.txt') as f:
#     contents = f.read()
#     print(contents)

with open('/Users/vlv/Desktop/begin.txt') as f:
    while True:
        line = f.readline()
        if not line: 
            break
        print(line) 