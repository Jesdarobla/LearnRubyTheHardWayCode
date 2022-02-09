#we define a function/method called cheese_and_crackers, that holds its own code like a mini-script.
#We pass it arguments that we are assining to cheese_count for the first passed, and boxed_of_crackers for the second passed.
#These 2 arguments can then be called inside the method by calling their names.
def cheese_and_crackers(cheese_count, boxes_of_crackers)
  puts "You have #{cheese_count} cheeses!" # Calling argument1, which has been assigned to cheese_count
  puts "You have #{boxes_of_crackers} boxes of crackers!" # Calling argument2, which has been assigned to cheese_count
  puts "Man that's enough for a party!"
  puts "Get a blanket.\n"
end

puts "we can just give the function numbers directly:"
#We call the function we have done and pass it 2 numbers as first and second argument
cheese_and_crackers(20, 30)

puts "OR, we can use variables from our script:"
#We create 2 variables and assign numbers to them, we can then pass the variable names to the function/method instead of the numbers.
amount_of_cheese = 10
amount_of_crackers = 50
#We pass the variables we have set up before to the function, and it will pass the values of each variable.
cheese_and_crackers(amount_of_cheese, amount_of_crackers)

puts "We can even do math inside too:"
#we can do math calculations inside the parameter bracket. The result of said mathematical operation will be passed as an argument
cheese_and_crackers(10 + 20, 5 + 6)

puts "And we can combine the two, variables and math:"
#We can also mix variables and mathematical operations and numbers if done correctly
cheese_and_crackers(amount_of_cheese + 100, amount_of_crackers + 1000 )
