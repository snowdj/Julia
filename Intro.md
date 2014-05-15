Julia code feels very familiar
#### Text file import
Although the Julia documentation makes numerous references to MATLAB in terms of code similarity, Julia feels very familiar to me as an R and Python user. Take reading a .csv file into a dataframe and finding the dimensions of the resulting object:

<pre><code>
#R: Read in 1987.csv from airline dataset into a dataframe
#No import statement needed to create a dataframe in R
airline1987 <- read.csv("~/airline/1987.csv")
dim(airline1987)
[1] 1311826      29
 
#Python: use pandas to create a dataframe
import pandas as pd
airline1987 = pd.read_csv("/Users/randyzwitch/airline/1987.csv")
airline1987.shape
Out[7]: (1311826, 29)
</code></pre>

<pre><code>
#Julia: use DataFrames to create a dataframe
using DataFrames
airline1987 = readtable("/Users/randyzwitch/airline/1987.csv")
size(airline1987)
(1311826,29)
</code></pre>
In each language, the basic syntax is to call a ‘read’ function, specify the .csv filename, then the defaults of the function read in a basic file. I also could’ve specified other keyword arguments, but for purposes of this example I kept it simple.

#### Looping
Looping in Julia is similar to other languages. Python requires proper spacing for each level of a loop, with a colon for each evaluated expression. And although you generally don’t use many loops in R, to do so requires using parenthesis and brackets.

<pre><code>
#Python looping to create a term-frequency dictionary
 
from collections import Counter
 
term_freq = Counter()
for word in english_dictionary:
  for url in url_list:
    if word in url_list:
      term_freq[word] += 1
</code></pre>
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

#### A small, but intense community
One thing that’s important to note about Julia at this stage is that it’s very early. If you’re going to be messing around with Julia, there’s going to be a lot of alone-time experimenting and reading the Julia documentation. There are also several other resources including a Julia-Users Google group, Julia for R programmers, individual discussions on GitHub in the ‘Issues’ section of each Julia package, and a few tutorials floating around (here and here).

Beyond just the written examples though, I’ve found that the budding Julia community is very helpful and willing in terms of answering questions. I’ve been bugging the hell out of John Myles White and he hasn’t complained (yet!), and even when code issues are raised through the users group or on GitHub, ultimately everyone has been very respectful and eager to help. So don’t be intimidated by the fact that Julia has a very MIT and Ph.D-ness to it…jump right in and migrate some of your favorite code over from other languages.

While I haven’t moved to using Julia for my everyday workload, I am getting facility to the point where I’m starting to consider using Julia for selected projects. Once the language matures a bit more, JuliaStudio starts to approach RStudio in terms of functionality, and I get more familiar with the language in general, I can see Julia taking over for at least one if not all of my scientific programming languages.


