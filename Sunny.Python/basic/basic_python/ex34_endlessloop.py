# Endless loop
ans=38

while 1:
    num=int(input('Enter a number:'))
    if num>ans: 
        print("Too big!")
    elif num<ans:
        print("Too small!")
    else:
        print("Bingo!")
        break
