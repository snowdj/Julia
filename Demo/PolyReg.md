Polynomial Regression with Julia
================================================

Find an approximating polynom of known degree for a given data.
Example: For input data:
<pre><code>
x = {0,  1,  2,  3,  4,  5,  6,   7,   8,   9,   10};
y = {1,  6,  17, 34, 57, 86, 121, 162, 209, 262, 321};
</code></pre>
The approximating polynomial is:
3x^2 2 + 2x + 1
Here, the polynom's coefficients are (3, 2, 1).


The least-squares fit problem for a degree n can be solved with the built-in backslash operator:
<pre><code>
function polyfit(x, y, n)
  A = [ float(x[i])^p for i = 1:length(x), p = 0:n ]
  A \ y
end
</code></pre>
Example output:
<pre><code>
julia> x = [0,  1,  2,  3,  4,  5,  6,   7,   8,   9,   10]
julia> y = [1,  6,  17, 34, 57, 86, 121, 162, 209, 262, 321]
julia> polyfit(x, y, 2)
3-element Array{Float64,1}:
 1.0
 2.0
 3.0
</code> </pre>
(giving the coefficients in increasing order of degree).
