people = 20
cats = 30
dogs = 15

#if statements run the code inside them if the condition given is true. If the condition is false, the code under if is not run.
if people < cats
  puts "Too many cats! The world is doomed!"
end

if people > dogs
  puts "The world is dry!"
end

dogs += 5

if people >= dogs
  puts "People are greater than or equal to dogs."
end

if people <= dogs
  puts "People are less than or equal to dogs."
end

if people == dogs
  puts "People are dogs."
end

if 1 != 0
  puts "1 is not equal to 0"
end

if true || false
  puts "This is an OR that will run"
end

if true && false
  puts "AND but will not run"
end

if true
  puts "Condition is true, so this code inside the if will run"
end

if false
  puts "this won't run, rip"
end
