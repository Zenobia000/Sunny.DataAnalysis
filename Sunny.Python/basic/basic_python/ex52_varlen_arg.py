# Function definition
def printinfo(arg1, *vartuple):
    print('Output is: ')
    print('first:',arg1)
    for var in vartuple:
        print(var)
    print()
    
# MAIN
# Call function
printinfo(10) # 10 first 
printinfo(70, 60, 50) # 70 first, 60,50 *vartuple

mylist=["a","b","c"]
printinfo(20, mylist)
printinfo(20, *mylist) # unpack，把一份資料切成很多份資料


