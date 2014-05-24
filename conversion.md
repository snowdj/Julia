Conversion
==============
Conversion of values to various types is performed by the convert function. The convert function generally takes two arguments: the first is a type object while the second is a value to convert to that type; the returned value is the value converted to an instance of given type. The simplest way to understand this function is to see it in action:

<pre><code>
julia> x = 12
12

julia> typeof(x)
Int64

julia> convert(Uint8, x)
0x0c

julia> typeof(ans)
Uint8

julia> convert(FloatingPoint, x)
12.0

julia> typeof(ans)
Float64
</code></pre>
