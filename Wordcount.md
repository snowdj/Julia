Word Count example
======================
Julia provides some very easy built-in mechanisms for parallelising your code, so to learn a bit of Julia and test out the language I decided to write a simple map-reduce “word count” program in the vein of the classic Hadoop example.  The code that follows can also be found on Github.

### Map function:
<pre><code>
# "Map" function.
# Takes a string. Returns a HashTable with the number of times each word 
# appears in that string.
function wordcount(text)
    words=split(text,(' ','\n','\t','-','.',',',':','_','"',';','!'),false)
    counts=HashTable()
    for w = words
        counts[w]=get(counts,w,0)+1
    end
    return counts
end
</code></pre>
### Reduce function:
<pre><code>
# "Reduce" function.
# Takes a collection of HashTables in the format returned by wordcount()
# Returns a HashTable in which words that appear in multiple inputs
# have their totals added together.
function wcreduce(wcs)
    counts=HashTable()
    for c = wcs
        for (k,v)=c
            counts[k] = get(counts,k,0)+v
        end
    end
    return counts
end
</code></pre>
Parallel word count on a string:
<pre><code>
# Splits input string into nprocs() equal-sized chunks (last one rounds up), 
# and @spawns wordcount() for each chunk to run in parallel. Then fetch()s
# results and performs wcreduce().
# Limitations: splitting the string and reduction step are single-threaded.
function parallel_wordcount(text)
    lines=split(text,'\n',false)
    np=nprocs()
    unitsize=ceil(length(lines)/np)
    wcounts={}
    rrefs={}
    # spawn procs
    for i=1:np
        first=unitsize*(i-1)+1
        last=unitsize*i
        if last>length(lines)
            last=length(lines)
        end
        subtext=join(lines[int(first):int(last)],"\n")
        push(rrefs, @spawn wordcount( subtext ) )
    end
    # fetch results
    while length(rrefs)>0
        push(wcounts,fetch(pop(rrefs)))
    end
    # reduce
    count=wcreduce(wcounts)
    return count
end
</code></pre>
