first, second = ARGV
name = first
surname = second
prompt = "Write below:"
print "Your full name is: #{name} #{surname}.\n"

puts "Do you like meat?", prompt
meat = $stdin.gets.chomp
puts "Do you like veggies?", prompt
veggie = $stdin.gets.chomp

puts """
So your answer to liking meat is: \"#{meat}\"
and your answer for liking veggies: \"#{veggie}\"
What a surprise!
"""
