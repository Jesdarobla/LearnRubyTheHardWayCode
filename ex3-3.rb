#The following file will calculate how much damage a sword attack will make
#without using variables, and only using numbers and puts

puts "You attacked with your sword!"

#Let's say the sword attack as a base damage value of 100, adding more flat values
# then multiplying it by the current attack buff in place, which is a 50% increase.
#Let's say we have 50 added damage
puts "You deal #{(100.0 + 50.0) * 1.50}"

#For the next attack, let's say we need to reduce the damage a certain value
# because of flat defense

puts "You attack again with your sword!"

#Let's say the enemy has 40 defense, which is the amount of damage we will substract from the attack
puts "You deal #{(100.0 + 50.0) * 1.50 - 40.0 }"

#For the last attack, we will also add a defense buff to the enemy, which will be a 30% damage reduction
# and a 10% defense increase.

puts "You attack with your sword one last time!"
puts "You deal #{((100.0 + 50.0) * 1.50 - 40.0 * 1.10) * 0.70} "
