# continue stmt
data='Python Is Funny'

for ch in data:
    if ch!=ch.upper(): 
        continue 
    print(ch, end='')
