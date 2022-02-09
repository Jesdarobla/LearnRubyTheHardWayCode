#ARGV = argument variable. It holds the arguments I pass my Ruby script when I run it.
#The line below "unpacks" the arguments passed when running the script. It takes whatever is inside ARGV,
# and assigns it to variables on the left in order.
first, second, third = ARGV

puts "Your first variable is: #{first}"
puts "Your second variable is: #{second}"
puts "Your third variable is: #{third}"
