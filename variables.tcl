puts "variables"

# Variables in TCL

# set variable_name value
set a 10
set name "Aditya"

puts $name

# Destroy a variable
unset name

# -nonewline avoids new line after the puts
puts -nonewline $a 
puts "new line"

# Arithematic operation
# expr $var1 operator $var2
set num1 10
set num2 12

set ans [expr $num1 + $num2]
puts -nonewline "Ans: "
puts $ans
