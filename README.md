# DUCTF2021_Writeup

My idea is to find the coefficients of the function f(x) by from the input 'DUCTF{}' with its corresponding output.txt file 'Ujyw5d4'. After finding the function f(x), along with the decrypt function in the solve.sage file, the flag of that exercise will be output.
To find the function coefficients f(x), I put f(x) in the general form:

![equation](http://www.sciweavers.org/tex2img.php?eq=f%28x%29%20%3D%20%20a%2Ax%5E%7B6%7D%20%2B%20b%2Ax%5E%7B5%7D%20%2B%20c%2Ax%5E%7B4%7D%20%2B%20d%2Ax%5E%7B3%7D%20%2B%20a1%2Ax%5E%7B2%7D%20%2B%20a2%2Ax%2B%20a3&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0)

We have CHARSET = "DUCTF{}_!?'" + ascii_lowercase + digits
==> CHASET="DUCTF{}_!?'abcdefghijklmnopqrstuvwxyz0123456789"

With input 'DUCTF{}' corresponding in CHASET is 0,1,2,3,4,5,6
With the corresponding output 'Ujyw5d4' in CHASET is 1,20,35,33,42,14,41
Since n=len(CHASET)=47 and P. < x > = PolynomialRing(GF(n)), then we have a system of equations:

![equation](http://www.sciweavers.org/tex2img.php?eq=%5Cbegin%7Bcases%7Df%28x%3D0%29%20mod%2047%20%3D%201%5C%5Cf%28x%3D1%29%20mod%2047%20%3D%2020%5C%5Cf%28x%3D2%29%20mod%2047%20%3D%2035%5C%5Cf%28x%3D3%29%20mod%2047%20%3D%2033%5C%5Cf%28x%3D4%29%20mod%2047%20%3D%2042%5C%5Cf%28x%3D5%29%20mod%2047%20%3D%2014%5C%5Cf%28x%3D6%29%20mod%2047%20%3D%2041%5C%5C%5Cend%7Bcases%7D%20%0A&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0)

And implementing we get:

![equation](http://www.sciweavers.org/tex2img.php?eq=%5Cbegin%7Bcases%7D%28a%2A0%5E%7B6%7D%20%2B%20b%2A0%5E%7B5%7D%20%2B%20c%2A0%5E%7B4%7D%20%2B%20d%2A0%5E%7B3%7D%20%2B%20a1%2A0%5E%7B2%7D%20%2B%20a2%2A0%20%2B%20a3%29%20mod%2047%20%3D%201%5C%5C%28a%2A1%5E%7B6%7D%20%2B%20b%2A1%5E%7B5%7D%20%2B%20c%2A1%5E%7B4%7D%20%2B%20d%2A1%5E%7B3%7D%20%2B%20a1%2A1%5E%7B2%7D%20%2B%20a2%2A1%20%2B%20a3%29%20mod%2047%20%3D%2020%5C%5C%28a%2A2%5E%7B6%7D%20%2B%20b%2A2%5E%7B5%7D%20%2B%20c%2A2%5E%7B4%7D%20%2B%20d%2A2%5E%7B3%7D%20%2B%20a1%2A2%5E%7B2%7D%20%2B%20a2%2A2%20%2B%20a3%29%20mod%2047%20%3D%2035%5C%5C%28a%2A3%5E%7B6%7D%20%2B%20b%2A3%5E%7B5%7D%20%2B%20c%2A3%5E%7B4%7D%20%2B%20d%2A3%5E%7B3%7D%20%2B%20a1%2A3%5E%7B2%7D%20%2B%20a2%2A3%20%2B%20a3%29%20mod%2047%20%3D%2033%5C%5C%28a%2A4%5E%7B6%7D%20%2B%20b%2A4%5E%7B5%7D%20%2B%20c%2A4%5E%7B4%7D%20%2B%20d%2A4%5E%7B3%7D%20%2B%20a1%2A4%5E%7B2%7D%20%2B%20a2%2A4%20%2B%20a3%29%20mod%2047%20%3D%2042%5C%5C%28a%2A5%5E%7B6%7D%20%2B%20b%2A5%5E%7B5%7D%20%2B%20c%2A5%5E%7B4%7D%20%2B%20d%2A5%5E%7B3%7D%20%2B%20a1%2A5%5E%7B2%7D%20%2B%20a2%2A5%20%2B%20a3%29%20mod%2047%20%3D%2014%5C%5C%28a%2A6%5E%7B6%7D%20%2B%20b%2A6%5E%7B5%7D%20%2B%20c%2A6%5E%7B4%7D%20%2B%20d%2A6%5E%7B3%7D%20%2B%20a1%2A6%5E%7B2%7D%20%2B%20a2%2A6%20%2B%20a3%29%20mod%2047%20%3D%2041%5Cend%7Bcases%7D%20%0A&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0)

To solve this system of equations I use sagemath in find_f.sage file:

A = matrix(GF(47), [[0,0,0,0,0,0,1],[1, 1, 1, 1, 1, 1,1],[64, 32, 16, 8 , 4, 2,1],[729, 243, 81
 , 27, 9, 3,1],[4096, 1024, 256, 64, 16, 4,1],[15625, 3125, 625, 125, 25, 5,1],[46656, 7776, 1296, 216 , 36, 6,1]])
b = matrix(GF(47), [1,20, 35, 33, 42, 14, 41]).transpose()
A.solve_right(b)

output: a=41, b=15, c=40, d=9, a1=28, a2=27, a3=1

After finding f(x), I wrote decrypt function in solve.sage file and used sagemath to find the flag but the 'f' in the flag had problem and I changed it to 'n' and finally the flag was "DUCTF{go0d_0l'_l4gr4ng3}"

![equation](http://www.sciweavers.org/upload/Tex2Img_1632743147/render.png)
