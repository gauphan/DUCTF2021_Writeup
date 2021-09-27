from string import ascii_lowercase, digits, printable
CHARSET = "DUCTF{}_!?'" + ascii_lowercase + digits
n = len(CHARSET)


def decrypt(enc, f):
    pt = ''
    for e in enc:
        for c in CHARSET:
            if e == CHARSET[f.substitute(CHARSET.index(c))]:
                pt += c
                break
    return pt


P.< x > = PolynomialRing(GF(n))
# using sagemath to solve f
# A = matrix(GF(47), [[1, 1, 1, 1, 1, 1],[64, 32, 16, 8, 4, 2],[729, 243, 81
#  , 27, 9, 3],[4096, 1024, 256, 64, 16, 4],[15625, 3125, 625, 125, 25, 5],[46656, 7776, 1296, 216, 36, 6]])
# b = matrix(GF(47), [19, 34, 32, 41, 13, 40]).transpose()
# A.solve_right(b)

# using sagemath to solve f
# A = matrix(GF(47), [[0,0,0,0,0,0,1],[1, 1, 1, 1, 1, 1,1],[64, 32, 16, 8, 4, 2,1],[729, 243, 81
#  , 27, 9, 3,1],[4096, 1024, 256, 64, 16, 4,1],[15625, 3125, 625, 125, 25, 5,1],[46656, 7776, 1296, 216, 36, 6,1]])
# b = matrix(GF(47), [1,20, 35, 33, 42, 14, 41]).transpose()
# A.solve_right(b)
f = 41*x ^ 6 + 15*x ^ 5 + 40*x ^ 4 + 9*x ^ 3 + 28*x ^ 2 + 27*x + 1
enc = 'Ujyw5dnFofaou0au3nx3Cn84'
enc = decrypt(enc, f)
print(enc)

#  DUCTF{go0d_0l'_l4gr4ng3}
