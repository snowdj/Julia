Installing Julia and IJulia
============================
Note: If you have MIT web certificates, you may be able to run IJulia remotely on our cluster, without installing anything, by going to https://ijulia.csail.mit.edu:8000. We are still setting up this server and availability may currently be intermittent, however.

First, install IPython and related scientific-Python packages (SciPy and Matplotlib). 


The simplest way to do this on Mac and Windows is by downloading the Anaconda package and running its installer.

Important: on Windows, the Anaconda installer window gives options Add Anaconda to the System Path and also Register Anaconda as default Python version of the system. Be sure to check these boxes.
Second, download Julia version 0.2 and run the installer. Do not download version 0.1. 

Then run the Julia application (double-click on it); a window with a julia> prompt will appear. At the prompt, type:

<pre><code>
Pkg.add("IJulia")
Pkg.add("PyPlot")
</code></pre>


https://github.com/stevengj/julia-mit/
