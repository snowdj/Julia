####################################################
## 5. Types and Multiple-Dispatch 
####################################################

# Type definition
type Tiger
  taillength::Float64
  coatcolor # no type annotation is implicitly Any
end
# default constructor is the properties in order
# so, Tiger(taillength,coatcolor)

# Type instantiation
tigger = Tiger(3.5,"orange") # the type doubles as the constructor function

# Abtract Types
abstract Cat # just a name and point in the type hierarchy

# * types defined with the type keyword are concrete types; they can be
#   instantiated
#
# * types defined with the abstract keyword are abstract types; they can
#   have subtypes.
#
# * each type has one supertype; a supertype can have zero or more subtypes.

type Lion <: Cat # Lion is a subtype of Cat
  mane_color
  roar::String
end

type Panther <: Cat # Panther is also a subtype of Cat
  eye_color
  Panther() = new("green")
  # Panthers will only have this constructor, and no default constructor.
end

# Multiple Dispatch

# In Julia, all named functions are generic functions
# This means that they are built up from many small methods
# For example, let's make a function meow:
function meow(cat::Lion)
  cat.roar # access properties using dot notation
end

function meow(cat::Panther)
  "grrr"
end

function meow(cat::Tiger)
  "rawwwr"
end

meow(tigger) #=> "rawwr"
meow(Lion("brown","ROAAR")) #=> "ROAAR"
meow(Panther()) #=> "grrr"

function pet_cat(cat::Cat)
  println("The cat says $(meow(cat))")
end

try
    pet_cat(tigger) #=> ERROR: no method pet_cat(Tiger,)
catch e
    println(e)
end

pet_cat(Lion(Panther(),"42")) #=> prints "The cat says 42"
