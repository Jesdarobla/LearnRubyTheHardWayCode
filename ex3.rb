# I start saying I'll count the chickens
puts "I will now count my chickens:"

#I count Hens first
puts "Hens #{25.0 + 30.0 / 6.0}"
#Then I count Roosters
puts "Roosters #{100.0 - 25.0 * 3.0 % 4.0}"

#Then, I say I'll count the eggs
puts "Now I will count the eggs:"

#I start counting the eggs using the numbers below
puts 3.0 + 2.0 + 1.0 - 5.0 + 4.0 % 2.0 - 1.0 / 4.0 + 6.0

#now I ask if the following operation is true
puts "Is it true that 3 + 2 < 5 - 7?"

#I test the operation by executing it as shown below, it will be false
puts 3.0 + 2.0 < 5.0 -7.0

#I ask and calculate the operation 3 + 2 from the previous operation
puts "What is 3 + 2? #{3.0 + 2.0}"
#I ask and calculate the operation 5 - 7 from the previous operation
puts "What is 5 - 7? #{5.0 - 7.0}"

#I output a line where I clarify that I have understood why the result is false
puts "Oh, that's why it's false."

#I let the reader know we are doing more tests
puts "How about some more."

#I test if the number 5 is greater than -2
puts "Is it greater? #{5.0 > -2.0}"
#I test if the number 5 is greater than OR equal to 2
puts "Is it greater or equal? #{ 5.0 >= -2.0}"
#I test if the number 5 is less than OR equal to 2
puts "Is it less or equal? #{5.0 <= -2.0}"
