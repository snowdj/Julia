
#### Basic Operations
<pre><code>
Arithmetic and functions of vectors and matrices: 
x * 3, x + 3 multiply/add every element of x by 3 
x + y element-wise addition of two vectors x and y 
A*y, A*B product of matrix A and vector y or matrix B 
x * y not defined for two vectors! 
x .* y element-wise product of vectors x and y 
x .^ 3 every element of x is cubed 
cos(x), cos(A) cosine of every element of x or A 
exp(A), expm(A) exp of each element of A, matrix exp eA
 
xʹ, Aʹ conjugate-transpose of vector or matrix 
x’*y, dot(x,y), sum(conj(x).*y) three ways to compute x · y 
A \ b, inv(A) return solution to Ax=b, or the matrix A–1 
λ, V = eig(A) eigenvals λ and eigenvectors (columns of V) of A 
</code></pre>

####  Complex Arithmetic
Julia has built-in support for complex arithmetic with arbitrary real types.
<pre><code>
julia> z1 = 1.5 + 3im
julia> z2 = 1.5 + 1.5im
julia> z1 + z2
3.0 + 4.5im
julia> z1 - z2
0.0 + 1.5im
julia> z1 * z2
-2.25 + 6.75im
julia> z1 / z2
1.5 + 0.5im
julia> - z1
-1.5 - 3.0im
julia> conj(z1), z1'   # two ways to conjugate
(1.5 - 3.0im,1.5 - 3.0im)
julia> abs(z1)
3.3541019662496847
julia> z1^z2
-1.102482955327779 - 0.38306415117199305im
julia> real(z1)
1.5
julia> imag(z1)
3.0
</code></pre>
#### Convert decimal number to rational
Julia has a native Rational type, and provides a convenience conversion function that implements a standard algorithm for approximating a floating-point number by a ratio of integers to within a given tolerance, which defaults to machine epsilon.
<pre><code>
rational(0.9054054)
rational(0.518518)
rational(0.75)
4527027//5000000
259259//500000
3//4
</code></pre>
Since Julia by default uses its Float64 type to represent floating-point numbers, if enough decimal digits are provided (so that the difference between the floating-point representation of the resulting fraction and the original number is smaller than the machine epsilon) the smaller fraction is returned, which in this case is the exact result:
<pre><code>
julia> rational(0.5185185185185185)
14//27
julia> rational(0.9054054054054054)
67//74
</code></pre>
#### Dot products
Dot products and many other linear-algebra functions are built-in functions in Julia (and are largely implemented by calling functions from LAPACK).
<pre><code>
x = [1, 3, -5]
y = [4, -2, -1]
z = dot(x, y)
</code></pre>
#### Odd and Even Numbers

<pre><code>
iseven
iseodd

</code></pre>

#### Reduced Row Echelon Form

Julia comes with a built-in function rref to compute the reduced-row echelon form:
<pre><code>
julia> matrix = [1 2 -1 -4 ; 2 3 -1 -11 ; -2 0 -3 22]
3x4 Int32 Array:
  1  2  -1   -4
  2  3  -1  -11
 -2  0  -3   22

julia> rref(matrix)
3x4 Array{Float64,2}:
 1.0  0.0  0.0  -8.0
 0.0  1.0  0.0   1.0
 0.0  0.0  1.0  -2.0
</code></pre> 

#### Temperature_ Conversion

<pre><code>
cfr(k) = print("Kelvin: $k, Celsius: $(round(k-273.15,2)), Fahrenheit: $(round(k*1.8-459.67,2)), Rankine: $(round(k*1.8,2))")
julia> cfr(21)
Kelvin: 21, Celsius: -252.15, Fahrenheit: -421.87, Rankine: 37.8
</code></pre>
