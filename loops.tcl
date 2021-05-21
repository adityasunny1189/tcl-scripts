set num 1

puts "While Loop"

while {$num < 10} {
	puts $num 
	set num [expr $num + 1]
}

puts "For Loop"

for {set a 11} {$a < 25} {incr a} {
	puts $a 
}