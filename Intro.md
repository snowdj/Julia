Introduction to Julia
=================================
#### Text file import
Reading a .csv file into a dataframe and finding the dimensions of the resulting object:

<pre><code>
#Julia: use DataFrames to create a dataframe
using DataFrames
airline1987 = readtable("/Users/randyzwitch/airline/1987.csv")
size(airline1987)
(1311826,29)
</code></pre>
In each language, the basic syntax is to call a ‘read’ function, specify the .csv filename, then the defaults of the function read in a basic file. 

#### Looping
Looping in Julia is similar to other languages.

<pre><code>
#Julia looping to create a term-frequency dictionary
 
term_freq=Dict{String, Int64}()
for word in english_dictionary
    for url in url_list
        if search(line, word) != (0:-1)
            term_freq[word]=get(term_freq,word,0)+1
        end
    end
end
</code></pre>

If you’re coming from a Python background, you can see that there’s not a ton of difference between Python looping into a dictionary vs. Julia. The biggest differences are the use of the ‘end’ control-flow word and that Julia doesn’t currently have the convenience “Counter” object type. R doesn’t natively have a dictionary type, but you can add a similar concept using the hash package.

#### Vectorization
While not required to achieve high performance, Julia also provides the functional programming construct of vectorization and list comprehensions. In R, you use the ‘apply’ family of functions instead of loops in order to apply a function to multiple elements in a list. In Python, there are the ‘map’ and ‘reduce’ functions, but there is also the concept of list comprehensions. In Julia, both of the aforementioned functionalities are possible.
<pre><code>
#Cube every number from 1 to 100
 
#Python map function 
cubes = map(lambda(x): x*x*x, range(1,100))
 
#Python list comprehension
cubes= [x*x*x for x in range(1,100)]
 
#R sapply function
cubes <- sapply(seq(1,100), function(x) x*x*x)
 
#Julia map function
cubes = map((x)-> x*x*x, [1:100])
 
#Julia list comprehension
cubes = [x*x*x for x in [1:100]]
</code></pre>
In each case, the syntax is just about the same to apply a function across a list/array of numbers.

