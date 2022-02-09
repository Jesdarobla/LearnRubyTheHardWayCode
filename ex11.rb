=begin
print "How old are you? "
age = gets.chomp
print "How tall are you? "
height = gets. chomp
print "How much do you weigh? "
weight = gets.chomp

puts "So, you're #{age} old, #{height} tall and #{weight} heavy."
=end

puts "New form incoming! "

print "How much Fantasias do you use a month? "
#gets is used to get keyboard input. chomp is used to cut the \n new line that is applied when using gets.
fanta = gets.chomp
print "How much is your subscription? "
sub = gets.chomp
print "How many times do you usually die in a Savage Raid? "
raiddeath = gets.chomp

puts "Using #{fanta} fantasias is okay, but paying #{sub} a month while dying #{raiddeath} times is not okay????"
