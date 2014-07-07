Introduction to Julia
=================================
### 00 What is Julia


Julia is a new homoiconic functional language focused on technical computing. While having the full 
power of homoiconic macros, first-class functions, and low-level control, Julia is as easy to learn and use as Python.

<hr>
00.1 Background
00.2 Installing Julia
00.3 Julia Studio and iJulia Notebooks
00.4 Some Important Terminology and Performance Issues
00.5 GitHub


### 01 Some Basic Operations
01.1 Mathematical Operations
01.2 Matrix Operations 


02 Programming Control Statements
02.1 For loops
02.2 While Loops
02.3 If Else
02.4 Other Programming Control Statements
02.5 The Fizz Buzz Test with Julia

04 Types
04.4 BigInt

05 Map Reduce
05.1 What is Map Reduce

06 Graphics with Julia
06.1 Winston Package
06.2 Gadfly Package

07 Project Euler Exercises
07.1 
07.1 




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

