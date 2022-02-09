name = 'Jesdarobla'
age = 26
height = 1.80 # meters
weight = 100 # kg
eyes = 'Dark Brown'
teeth = 'White'
hair = 'Black'

puts "Let's talk about #{name}."
puts "He's #{height} meters tall"
puts "He's #{weight} kilograms heavy"
puts "Actually that's not too heavy."
puts "He's got #{eyes} eyes and #{hair} hair."
puts "His teeth are usually #{teeth} depending on the coffee."

#this line is tricky, try to get it exactly right
puts "If I add #{age}, #{height}, and #{weight} I get #{age + height + weight}."

height_to_inches = height * 39.370
weight_to_pounds = weight * 2.204

puts "His heigh in inches is #{height_to_inches} and his weight in pounds is #{weight_to_pounds}"
