IJulia
===================
IJulia is a Julia-language backend combined with the IPython interactive environment. This combination allows you to interact with the Julia language using IPython's powerful graphical notebook, which combines code, formatted text, math, and multimedia in a single document

(This package also includes a prototype Python module to call Julia from Python, including "magics" to call Julia code from within a Python session in IPython.)

### Tutorial
High-level installation instructions using precompiled binaries, as well as a basic usage tutorial, can be found in these tutorial notes:

### Low-level installation info

First, you will need to install a few prerequisites:

- You need version 1.0 or later of IPython. Note that IPython 1.0 was released in August 2013, so the version pre-packaged with operating-system distribution is likely to be too old for the next few weeks or months. Until then, you may have to install IPython manually. On Mac and Windows systems, it is currently easiest to use the Anaconda Python installer.

- To use the IPython notebook interface, which runs in your web browser and provides a rich multimedia environment, you will need to install the Jinja2, Tornado, and pyzmq Python packages. (Given the pip installer, pip install jinja2 tornado pyzmq should be sufficient.) These should have been automatically installed if you installed IPython itself via easy_install or pip.

- To use the IPython qtconsole interface, you will need to install PyQt4 or PySide.

- You need Julia version 0.2 (or rather, a recent git master snapshot).

- Once IPython 1.0+ and Julia 0.2 is installed, you can install IJulia from a Julia console by typing:

<pre><code>
Pkg.add("IJulia")
</code></pre?
This will download IJulia and a few other prerequisites, and will set up a Julia profile for IPython.

If the command above returns an error, you may need to run `Pkg.update()`, then retry it.

#### References
- Julia at MIT https://github.com/stevengj/julia-mit/blob/master/README.md
- IPython http://ipython.org/notebook.html
