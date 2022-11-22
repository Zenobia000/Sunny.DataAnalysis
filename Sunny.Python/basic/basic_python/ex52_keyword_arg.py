# Function definition
def printinfo(name, age):
    """
    arguments:
        name: 使用者姓名
        age: 使用者年齡
    """
    print('Name:', name)
    print('Age', age)

# MAIN
# Call function
printinfo('Harris',40) # position arguments
printinfo(age=20, name='Mary') # keyword arguments
