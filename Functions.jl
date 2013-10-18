####################################################
## 4. Functions
####################################################

# Use the keyword function to create new functions
function add(x, y)
    println("x is $x and y is $y")

    # Functions implicitly return the value of their last statement
    x + y
end

add(5, 6) #=> 11 after printing out "x is 5 and y is 6"

# You can define functions that take a variable number of
# positional arguments
function varargs(args...)
    return args
end

varargs(1,2,3) #=> (1,2,3)

# The ... is called a splat.
# It can also be used in a fuction call
# to splat a list or tuple out to be the arguments
Set([1,2,3])    #=> Set{Array{Int64,1}}([1,2,3]) # produces a Set of Arrays
Set([1,2,3]...) #=> Set{Int64}(1,2,3) # this is equivalent to Set(1,2,3)

x = (1,2,3)     #=> (1,2,3)
Set(x)          #=> Set{(Int64,Int64,Int64)}((1,2,3)) # a Set of Tuples
Set(x...)       #=> Set{Int64}(2,3,1)


# You can define functions with optional positional arguments
function defaults(a,b,x=5,y=6)
    return "$a $b and $x $y"
end

defaults('h','g') #=> "h g and 5 6"
defaults('h','g','j') #=> "h g and j 6"
defaults('h','g','j','k') #=> "h g and j k"
try
    defaults('h') #=> ERROR: no method defaults(Char,)
    defaults() #=> ERROR: no methods defaults()
catch e
println(e)
end

# You can define functions that take keyword arguments
function keyword_args(;k1=4,name2="hello") # note the ;
    return ["k1"=>k1,"name2"=>name2]
end 

keyword_args(name2="ness") #=> ["name2"=>"ness","k1"=>4]
keyword_args(k1="mine") #=> ["k1"=>"mine","name2"=>"hello"]
keyword_args() #=> ["name2"=>"hello","k2"=>4]

# You can also do both at once
function all_the_args(normal_arg, optional_positional_arg=2; keyword_arg="foo")
    println("normal arg: $normal_arg")
    println("optional arg: $optional_positional_arg")
    println("keyword arg: $keyword_arg")
end

all_the_args(1, 3, keyword_arg=4)
# prints:
#   normal arg: 1
#   optional arg: 3
#   keyword arg: 4

# Julia has first class functions
function create_adder(x)
    adder = function (y)
        return x + y
    end
    return adder
end

# or equivalently
function create_adder(x)
    y -> x + y
end

# you can also name the internal function, if you want
function create_adder(x)
    function adder(y)
        x + y
    end
    adder
end

add_10 = create_adder(10)
add_10(3) #=> 13

# The first two inner functions above are anonymous functions
(x -> x > 2)(3) #=> true

# There are built-in higher order functions
map(add_10, [1,2,3]) #=> [11, 12, 13]
filter(x -> x > 5, [3, 4, 5, 6, 7]) #=> [6, 7]

# We can use list comprehensions for nice maps and filters
[add_10(i) for i=[1, 2, 3]] #=> [11, 12, 13]
[add_10(i) for i in [1, 2, 3]] #=> [11, 12, 13]
