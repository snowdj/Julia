
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
