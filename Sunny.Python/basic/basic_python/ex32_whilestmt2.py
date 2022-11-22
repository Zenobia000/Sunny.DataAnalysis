# Traditional Fibonacci series
a, b = 0, 1
while a < 10:
    print(a, end = ' ')
    temp = a
    a = b
    b = temp + b

print()

# Tuple style Fibonacci series
a, b = 0, 1
while a < 10:
    print(a, end = ' ')
    a, b = b, a+b
