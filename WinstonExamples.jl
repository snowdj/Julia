require("winston.jl")
import Winston.*

using Winston

x = linspace(0, 3pi, 100)
c = cos(x)
s = sin(x)

p = FramedPlot(
        title="title!",
        xlabel="\\Sigma x^2_i",
        ylabel="\\Theta_i")

add(p, FillBetween(x, c, x, s))
add(p, Curve(x, c, color="red"))
add(p, Curve(x, s, color="blue"))

file(p, "example1.png")


%-------------------------------------------%
using Winston
srand(42)

p = FramedPlot(
        aspect_ratio=1,
        xrange=(0,100),
        yrange=(0,100))

n = 21
x = linspace(0, 100, n)
yA = 40 + 10randn(n)
yB = x + 5randn(n)

a = Points(x, yA, kind="circle")
setattr(a, label="a points")

b = Points(x, yB)
setattr(b, label="b points")
style(b, kind="filled circle")

s = Slope(1, (0,0), kind="dotted")
setattr(s, label="slope")

l = Legend(.1, .9, {a,b,s})

add(p, s, a, b, l)

file(p, "example2.png")
