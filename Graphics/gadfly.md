Gadfly - Julia Graphics Package
======================
#### Plot invocations
Most interaction with Gadfly is through the plot function. Plots are described by binding data to aesthetics, and specifying a number of plot elements including scales, coordinates, guides, and geometries. Aesthetics are a set of special named variables that are mapped to plot geometry. How this mapping occurs is defined by the plot elements.

This "grammar of graphics" approach tries to avoid arcane incantations and special cases, instead approaching the problem as if one were drawing a wiring diagram: data is connected to aesthetics, which act as input leads, and elements, each self-contained with well-defined inputs and outputs, are connected and combined to produce the desired result.

#### Plotting arrays
If no plot elements are defined, point geometry is added by default. 
The point geometry takes as input the x and y aesthetics. So all that's needed to draw a scatterplot is to bind x and y.

<pre><code>
# E.g.
plot(x=1:10, y=2.^rand(10),
     Scale.y_sqrt, Geom.point, Geom.smooth,
     Guide.xlabel("Stimulus"), Guide.ylabel("Response"), Guide.title("Dog Training"))
</code></pre>     
