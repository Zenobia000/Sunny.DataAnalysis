# Function definition 
def printinfo(name, score=[]):
    
    print('Name:', name)
    avg = sum(score)/len(score) if len(score) > 0 else 0
    print('Average', avg)

# MAIN
# Call function
printinfo(score=[50,70,100], name='Calvin')   # 
printinfo(name='Calvin')   # 




