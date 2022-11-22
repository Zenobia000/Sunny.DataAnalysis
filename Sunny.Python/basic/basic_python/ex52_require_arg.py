# Function definition
def bmi(height,weight):
    return weight/(height/100)**2

# MAIN
# Call function
result = bmi(15,8)
print('BMI =',round(result, 2))
print(f"BMI = {result:.2f}")

