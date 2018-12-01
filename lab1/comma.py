a = "d'super"

# if "'" in a: print('!!!!!!!!')

b = []
for let in a:
    if let == "'":
        b.append("'")
    b.append(let)
b = ''.join(b)
print(b)