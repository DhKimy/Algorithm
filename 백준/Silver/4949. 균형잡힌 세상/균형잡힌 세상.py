import sys
answer_list = []
while True:
    a = sys.stdin.readline().rstrip()
    if a == '.':
        break
    answer = []
    for i in a:
        if i.isalpha() or i == " ":
            continue
        elif i == '.':
            break
        elif i == '(':
            answer.append(i)
        elif i == '[':
            answer.append(i)
        elif i == ')':
            if len(answer) != 0 and answer[-1] == '(':
                answer.pop()
            else:
                answer.append(')')
                continue
        elif i == ']':
            if len(answer) != 0 and answer[-1] == '[':
                answer.pop()
            else:
                answer.append(']')
                continue
    if len(answer) == 0:
        answer_list.append("yes")
    else:
        answer_list.append("no")

for i in answer_list:
    print(i)