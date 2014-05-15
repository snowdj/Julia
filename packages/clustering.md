clustering
=============================

Basic functions for clustering data: k-means, dp-means, etc.
#### Basic Information
- Current Version: 0.2.5 (updated: 2014-01-18)
- Maintainer: Julia Statistics

#### Dependencies:
- julia                    [0.2.0-,∞)
- Distance                 [0.0.0-,∞)
- StatsBase                [0.3.0-,∞)
- NumericExtensions        [0.0.0-,∞)

#### Example 
<pre><code>
load("Clustering")
 
using Clustering
 
srand(1)
 
n = 100

x = vcat(randn(n, 2), randn(n, 2) .+ 10)

true_assignments = vcat(zeros(n), ones(n))

results = k_means(x, 2)

results.assignments

</code></pre>



#### References
https://github.com/JuliaStats/Clustering.jl
