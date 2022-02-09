# We assign 10 to the variable types_of_people
types_of_people=10

# If we use single-quotes('') instead of double-quotes(""), the #{} does NOT output the value of the variable
# instead, it will output the following: There are #{types_of_people} types of people.
# This happens by Ruby design.

# We assign a string containing a embedded variable name to output its value
x = "There are #{types_of_people} types of people."
# We assign a binary variable a string
binary = "binary"
#We assign a do_not variable a string
do_not = "don't"
#we assign a string containing 2 different embedded variables to output their value inside the string
y = "Those who know #{binary} and those who #{do_not}" # 1&2: strings are added to strings

#print the value of x
puts x
#print the value of y
puts y

#print a string with a variable embedded inside
puts "I said: #{x}." # 3: another string is added to a string
#print a string with a variable embedded inside
puts "I also said: '#{y}'." # 4: another string is added to a string.

#assign a variable a boolean value
hilarious = false
#assign a variable a string with a variable embedded inside
joke_evaluation = "Isn't that joke so funny?! #{hilarious}"

#print the value of joke_evaluation
puts joke_evaluation

#Assign a variable a string
w = "This is the left side of..."
#Assign a variable a string
e = "a string with a right side."

#we add both variables containing strings forming a longer string
#this is called string concatenation
puts w + e
