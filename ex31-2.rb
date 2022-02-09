puts "Death approacheth, thus what dou maketh?"

puts "1. I delete death"
puts "2. I let death delete me"
puts "3. I wish to live, now and forever"

print "> "

choice = $stdin.gets.chomp

if choice == "1"
  puts "Death cannot be deleted, and thus you perish"
  puts "In the underworld, you understand what it meant to be alive"

  puts "1. Fight death again for another chance at living"
  puts "2. Leave and stay dead."

  print "> "

  under = $stdin.gets.chomp
  if under == "1"
    puts "You win, and live to see another day."
  elsif under == "2"
    puts "You remain dead, and you fade away, becoming one with the universe"
  end
elsif choice == "2"
  puts "Death tries to delete you, but your lack of fear of death prevents it from affecting you."
  puts "Death leaves, and you live to see another day."
elsif choice == "3"
  puts "Your wishes are heard by the heavens, and make you an offer."
  puts "Live now after fighting death, and become the new death, or die and be forgotten"

  puts "1. Become death"
  puts "2. Die"

  rest = $stdin.gets.chomp

  if rest == "1"
    puts "You fight death, win and become the embodiment of fear of many."
  elsif rest == "2"
    puts "You die, your soul is lost in limbo and you never find rest, such is the fate of those who oppose heavens."
  end
end
