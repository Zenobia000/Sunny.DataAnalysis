# Function definition
def changeme(snoopy):
    print('In function, before change:', snoopy) #["name":"leo", "age":20]
    snoopy["age"] = 50
    print('In function, after change:', snoopy) #["name":"leo", "age":50]
    
# MAIN
# Call function
pikachu = {"name":"leo", "age":20}
changeme(pikachu)
print('Outside function:',pikachu)