
#### Renaming a File
<pre><code>
mv("input.txt", "output.txt")
mv("docs", "mydocs")
mv("/input.txt", "/output.txt")
mv("/docs", "/mydocs")
</code></pre>

#### Reversing a String
<pre><code>
julia> reverse("hey")
"yeh"
</code></pre>


#### String Size and Length

Julia encodes strings as UTF-8, so the byte length (via sizeof) will be different from the string length (via length) only if the string contains non-ASCII characters.
***Byte Length***
<pre><code>
sizeof("Hello, world!") # gives 13
sizeof("Hellö, wørld!") # gives 15
</code></pre>
***Character Length***
<pre><code>
length("Hello, world!") # gives 13
length("Hellö, wørld!") # gives 13
</code></pre>
