def myfunc():
    global data
    data='myfunc'
    
# MAIN
for data in range(10):
    print(data,end=' ')
print()
    
# Call function
myfunc()

print(f'data now is {data}')