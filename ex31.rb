puts "You enter a dark room with three doors. Do you go through door #1, door #2 or the misterious door #3?"

print "> "

door = $stdin.gets.chomp

if door == "1"
  puts "There's a giant beat here eating a cheese cake. What do you do?"
  puts "1. Take the cake."
  puts "2. Scream at the bear."
  puts "3. Shoot the bear with your gun"

  print "> "
  bear = $stdin.gets.chomp

  if bear == "1"
    puts "The bear eats your face off. Good job!"
  elsif bear == "2"
    puts "The bear eats your legs off. Good job!"
  elsif bear == "3"
    puts "You shoot the bear, but the bear is agile, dodges the bullet and eats your arms."
  else
    puts "Well, doing %s is probably better. Bear runs away." % bear
  end

elsif door == "2"
  puts "You stare into the endless abyss at Cthulhu's retina."
  puts "1. Blueberries."
  puts "2. Yellow jacket clothespins."
  puts "3. Understanding revolvers yelling melodies."

  print "> "
  insanity = $stdin.gets.chomp

  if insanity == "1" || insanity == "2"
    puts "Your body survives powered by a mind of jello. Good job!"
  else
    puts "The insanity rots your eyes into a pool of muck. Good job!"
  end

elsif door == "3"

  puts "You find yourself in a field, and something looking like a pineapple is nearby. What do?"

  puts "1. Get close to it."
  puts "2. Run from it."
  puts "3. Ignore it."

  print "> "

  pineapple = $stdin.gets.chomp

  if pineapple == 1
    puts "The pineapple eats you."
  elsif pineapple == 2
    puts "You ran and escaped the pineapple."
  else
    puts "The pineapple is offended, and eats your legs."
  end

else
  puts "You stumble around and fall on a knife and die. Good job!"
end
