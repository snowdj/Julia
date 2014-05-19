#### Approach 1
<pre><code>
for i = 99:-1:1 print("\n$i bottles of beer on the wall\n$i bottles of beer\nTake one down, pass it around\n$(i-1) bottles of beer on the wall\n") end
</code></pre>
#### Approach 2
another solution, handling grammar cases "No more bottles", "1 bottle", "<n> bottles"

<pre><code>
bottles(n) = n==0 ? "No more bottles" :
             n==1 ? "1 bottle" :
             "$n bottles"
 
for n = 99:-1:1
    println("""
        $(bottles(n)) of beer on the wall
        $(bottles(n)) of beer
        Take one down, pass it around
        $(bottles(n-1)) of beer on the wall
    """)
end
</code></pre>
#### Approach 3

shorter, but more criptic, version of the previous "bottles" function
<pre><code>
bottles(n) = "$(n==0 ? "No more" : n) bottle$(n==1 ? "" : "s")"
</code></pre>
