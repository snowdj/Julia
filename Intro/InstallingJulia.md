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

<hr>
roubleshooting:

If you ran into a problem with the above steps, after fixing the problem you can type Pkg.build() to try to rerun the install scripts.
If you tried it a while ago, try running Pkg.update() and try again: this will fetch the latest versions of the Julia packages in case the problem you saw was fixed. Run Pkg.build("IJulia") if your Julia version may have changed. If this doesn't work, try just deleting the whole .julia directory in your home directory (on Windows, it is called AppData\Roaming\julia\packages in your home directory) and re-adding the packages.
On MacOS, you currently need MacOS 10.7 or later; MacOS 10.6 doesn't work (unless you compile Julia yourself, from source code).
If Pkg.add("IJulia") says that the IJulia package doesn't exist, then you probably downloaded Julia 0.1 by mistake. Download Julia 0.2, run Pkg.update() in Julia, and try again.
On Windows, if you get an error no module named site when using PyPlot, probably you forgot to check the boxes in the Anaconda installer (above) to register Anaconda as the default Python version. Either re-install Anaconda or set the environment variables PYTHONHOME=C:\Anaconda and PYTHONPATH=C:\Anaconda\Lib.
If the browser opens the notebook and 1+1 works but basic functions like sin(3) don't work, then probably you are running Python and not Julia. Look in the upper-left corner of the notebook window: if it says IP[y]: Notebook then you are running Python. Probably this was because your Pkg.add("IJulia") failed and you ignored the error.
Internet Explorer 8 (the default in Windows 7) or 9 don't work with the notebook; use Firefox (6 or later) or Chrome (13 or later). Internet Explorer 10 in Windows 8 works (albeit with a few rendering glitches), but Chrome or Firefox is better.
If the notebook opens up, but doesn't respond (the input label is In[*] indefinitely), try running ipython notebook (without Julia) to see if 1+1 works in Python. If it is the same problem, then probably you have a firewall running on your machine (this is common on Windows) and you need to disable the firewall or at least to allow the IP address 127.0.0.1. (For the Sophos endpoint security software, go to "Configure Anti-Virus and HIPS", select "Authorization" and then "Websites", and add 127.0.0.1 to "Authorized websites"; finally, restart your computer.)
On Windows, if the notebook says the kernel crashed (repeatedly) and there is an error message "julia-readline.exe" is not recognized in the command-line window, the problem is that you aren't running the ipython command from within the Julia bin directory; see the "Important" note below.
