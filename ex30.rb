people = 30
cars = 40
trucks = 15

if cars > people # should the if statement be false, Ruby will skip the code inside the if until it finds an else or elseif.
  puts "We should take the cars."
elsif cars < people  # elseif will do another condition check, and if true, it will run the code inside it. Otherwise it goes to the next elseif or else
  puts "we should not take the cars."
else # if NONE of the previous if or elseif have met their conditions(all false), else is run instead. else doesn't check for condition, it is always run if no previous condition checks have succeded.
  puts "We can't decide"
end

#if statement checks for condition, if TRUE, it run the code block inside it, otherwise it checks for elseif for another condition check or else.
if trucks > cars
  puts "That's too many trucks."
elsif trucks < cars
  puts "Maybe we could take the trucks."
else
  puts "We still can't decide"
end

if people > trucks
  puts "Alright, let's just take the trucks."
else
  puts "Fine, let's stay home then."
end
