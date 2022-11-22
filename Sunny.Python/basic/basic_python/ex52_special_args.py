# Positional only
# / 左邊的參數視為 positional only 
def tri_area(b,h,/):
    return b*h/2.

# Keyword only
# * 右邊的參數視為 keyword only
def rect_area(*,length,width):
    return length*width

# Positional or Keyword
# 正常的function
def BMI(weight,height):
    return weight/(height/100)**2


# MAIN
tri_area(12,5)

rect_area(width=100, length=150)

BMI(65, height=170)




