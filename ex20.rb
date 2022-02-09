# We get input from terminal, assign the first argument passed to variable.
input_file = ARGV.first

#we define a new method that will output the file content
def print_all(f)
  puts f.read
end

#we define a new method that will rewind the file "cursor", more info in file ex20_gets.chomp_on_file_object.rb
def rewind(f)
  f.seek(0) # seek is a method that will "seek" the position given, so to speak.
  # seek will basically go to the position 0, "rewinding" the cursor position
  # more info about seek in https://stackoverflow.com/questions/21617708/what-does-seek-means-in-ruby
end

#We define a new method that will print a line everytime it is run.
def print_a_line(line_count, f)
  #When using gets.chomp with a File Object, we get the first line as input. If you run it again, you get the next line.
  #More in depth info on this in file ex20_gets.chomp_on_file_object.rb
  puts "#{line_count}, #{f.gets.chomp}"
end

#Open a file, creating a File Object and assigning it to a variable.
current_file = open(input_file)

puts "First let's print the whole file:\n"
#call print_all method passing an argument, in this case a our File Object from the file we opened.
print_all(current_file)

puts "Now let's rewind, kind of like a tape"
#call rewind method passing an argument, in this case a our File Object from the file we opened, to reset the cursor
rewind(current_file)

puts "Let's print three lines:"
#creating a variable that holds a number.
current_line = 1
#Calling function passing the variable containing the number, and the File Object, same for all above.
print_a_line(current_line, current_file)

current_line += 1 # = 2
print_a_line(current_line, current_file)  #Everytime we run the function, we are moving the cursor to the next line.

current_line += 1 # = 3
print_a_line(current_line,current_file) #Calling the function now will output the 3rd line of the txt file, considering cursor position.

puts "Resetting again, printing another line after reset"
rewind(current_file)
print_a_line(1, current_file)
