####################################################
## 2. Variables and Collections
####################################################

# Printing is pretty easy
println("I'm Julia. Nice to meet you!")

# No need to declare variables before assigning to them.
some_var = 5 #=> 5 
some_var #=> 5

# Accessing a previously unassigned variable is an error
try
  some_other_var #=> ERROR: some_other_var not defined
catch e
    println(e)
end

# Variable name start with a letter. You can use uppercase letters, digits,
# and exclamation points as well after the initial alphabetic character.
SomeOtherVar123! = 6 #=> 6

# You can also use unicode characters
☃ = 8 #=> 8

# A note on naming conventions in Julia:
#
# * Names of variables are in lower case, with word separation indicated by
#   underscores ('\_').
#
# * Names of Types begin with a capital letter and word separation is shown
#   with CamelCase instead of underscores.
#
# * Names of functions and macros are in lower case, without underscores.
#
# * Functions that modify their inputs have names that end in !. These
#   functions are sometimes called mutating functions or in-place functions.

# Arrays store a sequence of values indexed by integers 1 through n:
a = Int64[] #=> 0-element Int64 Array

# 1-dimensional array literals can be written with comma-separated values.
b = [4, 5, 6] #=> 3-element Int64 Array: [4, 5, 6]
b[1] #=> 4
b[end] #=> 6

# 2-dimentional arrays use space-separated values and semicolon-separated rows.
matrix = [1 2; 3 4] #=> 2x2 Int64 Array: [1 2; 3 4]

# Add stuff to the end of a list with push! and append!
push!(a,1)     #=> [1]
push!(a,2)     #=> [1,2]
push!(a,4)     #=> [1,2,4]
push!(a,3)     #=> [1,2,4,3]
append!(a,b) #=> [1,2,4,3,4,5,6]

# Remove from the end with pop
pop!(b)        #=> 6 and b is now [4,5]

# Let's put it back
push!(b,6)   # b is now [4,5,6] again.

a[1] #=> 1 # remember that Julia indexes from 1, not 0!

# end is a shorthand for the last index. It can be used in any
# indexing expression
a[end] #=> 6

# Function names that end in exclamations points indicate that they modify
# their argument.
arr = [5,4,6] #=> 3-element Int64 Array: [5,4,6]
sort(arr) #=> [4,5,6]; arr is still [5,4,6]
sort!(arr) #=> [4,5,6]; arr is now [4,5,6]

# Looking out of bounds is a BoundsError
try
    a[0] #=> ERROR: BoundsError() in getindex at array.jl:270
    a[end+1] #=> ERROR: BoundsError() in getindex at array.jl:270
catch e
    println(e)
end

# Errors list the line and file they came from, even if it's in the standard
# library. If you built Julia from source, you can look in the folder base
# inside the julia folder to find these files.

# You can initialize arrays from ranges
a = [1:5] #=> 5-element Int64 Array: [1,2,3,4,5]

# You can look at ranges with slice syntax.
a[1:3] #=> [1, 2, 3]
a[2:] #=> [2, 3, 4, 5]

# Remove arbitrary elements from a list with splice!
arr = [3,4,5]
splice!(arr,2) #=> 4 ; arr is now [3,5]

# Concatenate lists with append!
b = [1,2,3]
append!(a,b) # Now a is [1, 3, 4, 5, 1, 2, 3]

# Check for existence in a list with contains
contains(a,1) #=> true

# Examine the length with length
length(a) #=> 7

# Tuples are immutable.
tup = (1, 2, 3) #=>(1,2,3) # an (Int64,Int64,Int64) tuple.
tup[1] #=> 1
try:
    tup[0] = 3 #=> ERROR: no method setindex!((Int64,Int64,Int64),Int64,Int64)
catch e
    println(e)
end

# Many list functions also work on tuples
length(tup) #=> 3
tup[1:2] #=> (1,2)
contains(tup,2) #=> true

# You can unpack tuples into variables
a, b, c = (1, 2, 3) #=> (1,2,3)  # a is now 1, b is now 2 and c is now 3

# Tuples are created by default if you leave out the parentheses
d, e, f = 4, 5, 6 #=> (4,5,6)

# Now look how easy it is to swap two values
e, d = d, e  #=> (5,4) # d is now 5 and e is now 4


# Dictionaries store mappings
empty_dict = Dict() #=> Dict{Any,Any}()

# Here is a prefilled dictionary
filled_dict = ["one"=> 1, "two"=> 2, "three"=> 3]
# => Dict{ASCIIString,Int64}

# Look up values with []
filled_dict["one"] #=> 1

# Get all keys
keys(filled_dict)
#=> KeyIterator{Dict{ASCIIString,Int64}}(["three"=>3,"one"=>1,"two"=>2])
# Note - dictionary keys are not sorted or in the order you inserted them.

# Get all values 
values(filled_dict)
#=> ValueIterator{Dict{ASCIIString,Int64}}(["three"=>3,"one"=>1,"two"=>2])
# Note - Same as above regarding key ordering.

# Check for existence of keys in a dictionary with contains, haskey
contains(filled_dict, ("one", 1)) #=> true
contains(filled_dict, ("two", 3)) #=> false
haskey(filled_dict, "one") #=> true
haskey(filled_dict, 1) #=> false

# Trying to look up a non-existing key will raise an error
try
    filled_dict["four"] #=> ERROR: key not found: four in getindex at dict.jl:489
catch e
    println(e)
end

# Use get method to avoid the error
# get(dictionary,key,default_value)
get(filled_dict,"one",4) #=> 1
get(filled_dict,"four",4) #=> 4

# Sets store sets
empty_set = Set() #=> Set{Any}()
# Initialize a set with a bunch of values
filled_set = Set(1,2,2,3,4) #=> Set{Int64}(1,2,3,4)

# Add more items to a set
add!(filled_set,5) #=> Set{Int64}(5,4,2,3,1)

# There are functions for set intersection, union, and difference.
other_set = Set(3, 4, 5, 6) #=> Set{Int64}(6,4,5,3)
intersect(filled_set, other_set) #=> Set{Int64}(3,4,5)
union(filled_set, other_set) #=> Set{Int64}(1,2,3,4,5,6)
setdiff(Set(1,2,3,4),Set(2,3,5)) #=> Set{Int64}(1,4)

# Check for existence in a set with contains 
contains(filled_set,2) #=> true
contains(filled_set,10) #=> false
