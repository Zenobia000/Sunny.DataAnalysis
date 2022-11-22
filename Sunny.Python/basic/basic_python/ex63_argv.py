import sys
# C-style
for i in range(len(sys.argv)):
    print(f'sys.argv[{i}]={sys.argv[i]}')
print()

# Python-style
for arg in sys.argv:
    print(arg)
print()

# Python-style
print(f'Program name: {sys.argv[0]}')
print(f'All parameters:',end=' ')
for arg in sys.argv[1:]:
    print(arg,end=' ')

print()
