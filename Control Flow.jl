####################################################
## 3. Control Flow
####################################################

# Let's make a variable
some_var = 5

# Here is an if statement. Indentation is NOT meaningful in Julia.
# prints "some var is smaller than 10"
if some_var > 10
    println("some_var is totally bigger than 10.")
elseif some_var < 10    # This elseif clause is optional.
    println("some_var is smaller than 10.")
else                    # The else clause is optional too.
    println("some_var is indeed 10.")
end


# For loops iterate over iterables, such as ranges, lists, sets, dicts, strings.

for animal=["dog", "cat", "mouse"]
    # You can use $ to interpolate into strings
    println("$animal is a mammal")
end
# prints:
#    dog is a mammal
#    cat is a mammal
#    mouse is a mammal

# You can use in instead of =, if you want.
for animal in ["dog", "cat", "mouse"]
    println("$animal is a mammal")
end

for a in ["dog"=>"mammal","cat"=>"mammal","mouse"=>"mammal"]
    println("$(a[1]) is $(a[2])")
end

for (k,v) in ["dog"=>"mammal","cat"=>"mammal","mouse"=>"mammal"]
    println("$k is $v")
end


# While loops go until a condition is no longer met.
# prints:
#   0
#   1
#   2
#   3
x = 0
while x < 4
    println(x)
    x += 1  # Shorthand for x = x + 1
end

# Handle exceptions with a try/except block
try
   error("help")
catch e
   println("caught it $e")
end
#=> caught it ErrorException("help")
