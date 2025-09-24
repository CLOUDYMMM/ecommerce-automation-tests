def Print(y):
    for i in range(y):
        row = []
        for j in range(y):
            if j == 0 or j == y - 1 or i == j:
                row.append('X')
            else:
                row.append('O')
        print(' '.join(row))


Print(5)
Print(7)