Fibonacci Sequence with Julia
===============================

#### Recursive
<pre><code>
fib(n) = n < 2 ? n : fib(n-1) + fib(n-2)
</code></pre>

#### Iterative
<pre><code>
function fib(n)
  x,y = (0,1)
  for i = 1:n x,y = (y, x+y) end
  x
end
</code></pre>

#### Matrix form
<pre><code>
fib(n) = ([1 1 ; 1 0]^n)[1,2]
</code></pre>
