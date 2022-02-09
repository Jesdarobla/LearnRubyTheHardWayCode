print "Give me a number: "
number = gets.chomp.to_i

bigger = number * 100
puts "A bigger number is #{bigger}"

print "Give me another number: "
another = gets.chomp
number = another.to_i

smaller = number / 100
puts "A smaller number is #{smaller}."

# to_f converts to a floating point number
print "Give me a whole number: "
flo = gets.chomp.to_f

puts "The floating equal would be #{flo}"
