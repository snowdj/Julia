Map-Reduce with Julia
========================

**The map/reduce idiom is trivial in the Julia Programming Language (as are numerous other things)**
http://juliaforquants.blogspot.co.uk/2012/10/the-mapreduce-idiom-is-trivial-in-julia.html

Stefan Karpinski was kind enough to stop by my office the other day and chat about Julia, the recently unveiled programming language for technical computing he has been working on for three years. My interest had been piqued some time prior when I noticed what Viral Shah, one of Stefan's collaborators, had been up to. A few years back Viral had been kind enough to fill in a few holes in starp, a kind of data-parallel Matlab developed by Interactive Supercomputing that, though not a commercial success (to my knowledge) was certainly interesting from the point of view of rapid prototyping.

Not to overstate the demise of star-p, Julia has been developed by many of the same people and its hub is Alan Edelman's group at MIT. Because Julia is pitched as an attempt to create an "awesomely" productive scientific language in every sense (everything from cleanliness of "mathematical" syntax to C++ competitive performance) there are probably many different aspects of the effort that appeal to different people. But for me it is the built in data-parallelism and the possibility that a lot of overhyped "frameworks", which I personally find a bit clunky, can be obviated by a richer language designed from the ground up for both ease of use and scalability.

The following example demonstrates that the easy stuff is easy, as it should be. 

#### Exhibit: Map/Reduce

1. Tell julia to use multiple processes when you start it up  julia -p 16 
2. Create some data files  for k=1:32 csvwrite(strcat("example-data/A",k,".csv"),rand(5000,20); end
3. Write something that acts on them, such as:

<pre><code>
function countThirdColumn(k::Integer)
  A=csvread(strcat("example-data/A",k,".csv"))
  return(sum(A[:,3]))
  end
</code></pre>

4. Issue a "map/reduce" style call

<pre><code>
      theAnswer = sum(pmap(countThirdColumn,[1:32]))
</code></pre>
- Here "map" is achieved by pmap, which stands for "parallel map". 
- The sum is an example of a "reduction".
