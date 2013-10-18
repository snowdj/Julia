# Single line comments start with a hash.

####################################################
## 1. Primitive Datatypes and Operators
####################################################

# Everything in Julia is a expression.

# You have numbers
3 #=> 3 (Int64)
3.2 #=> 3.2 (Float64)
2 + 1im #=> 2 + 1im (Complex{Int64})
2//3 #=> 2//3 (Rational{Int64})

# Math is what you would expect
1 + 1 #=> 2
8 - 1 #=> 7
10 * 2 #=> 20
35 / 5 #=> 7.0
5 \ 35 #=> 7.0
5 / 2 #=> 2.5
div(5, 2) #=> 2
2 ^ 2 #=> 4 # power, not bitwise xor
12 % 10 #=> 2

# Enforce precedence with parentheses
(1 + 3) * 2 #=> 8

# Bitwise Operators
~2 #=> -3   # bitwise not
3 & 5 #=> 1 # bitwise and
2 | 4 #=> 6 # bitwise or
2 $ 4 #=> 6 # bitwise xor
2 >>> 1 #=> 1 # logical shift right
2 >> 1  #=> 1 # arithmetic shift right
2 << 1  #=> 4 # logical/arithmetic shift left

# You can use the bits function to see the binary representation of a number.
bits(12345)
#=> "0000000000000000000000000000000000000000000000000011000000111001"
bits(12345.0)
#=> "0100000011001000000111001000000000000000000000000000000000000000"

# Boolean values are primitives
true
false

# Boolean operators
!true #=> false
!false #=> true
1 == 1 #=> true
2 == 1 #=> false
1 != 1 #=> false
2 != 1 #=> true
1 < 10 #=> true
1 > 10 #=> false
2 <= 2 #=> true
2 >= 2 #=> true
# Comparisons can be chained
1 < 2 < 3 #=> true
2 < 3 < 2 #=> false

# Strings are created with "
"This is a string."

# Character literals written with '
'a'

# A string can be treated like a list of characters
"This is a string"[1] #=> 'T' # Julia indexes from 1

# $ can be used for string interpolation:
"2 + 2 = $(2 + 2)" #=> "2 + 2 = 4"
# You can put any Julia expression inside the parenthesis.

# Another way to format strings is the printf macro.
@printf "%d is less than %f" 4.5 5.3 # 5 is less than 5.300000


