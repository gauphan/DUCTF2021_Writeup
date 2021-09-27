from string import ascii_lowercase, digits
CHARSET = "DUCTF{}_!?'" + ascii_lowercase + digits
n = len(CHARSET)

def encrypt(msg, f):
    ct = ''
    for c in msg:
        print(CHARSET.index(c))
        print(f.substitute(CHARSET.index(c)))
        print(CHARSET[f.substitute(CHARSET.index(c))])
        print("-----------")
        ct += CHARSET[f.substitute(CHARSET.index(c))]
    return ct

P.<x> = PolynomialRing(GF(n))
f = P.random_element(6)
print(f)
FLAG = 'DUCTF{hello_world}'

enc = encrypt(FLAG, f)
print(enc)
