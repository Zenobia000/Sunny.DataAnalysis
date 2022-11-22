# Function definition
def changeme(snoopy):
    print('In function, before change:', snoopy) #{"name":"leo", "age":20}
    #snoopy["age"] = 50
    snoopy = 60
    print('In function, after change:', snoopy) # 60
    
# MAIN
# Call function
pikachu = {"name":"leo", "age":20}
changeme(pikachu)
print('Outside function:',pikachu) #{"name":"leo", "age":20}