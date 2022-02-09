
#We get a filename from an argument that we pass from the terminal, but we only assign the first one if more than 1 is passed.
filename = ARGV.first
#We open a file to have access to its contents. Since we have the filename in the filename variable, we use the variable to specify the file.
txt = open(filename)

# We output the file name to the screen.
puts "Here's your file #{filename}:"
#We call a function on variable txt called read, which will read the content of the file and return it.
#Since we are printing the return value of the read function, the content of the file is printed.
print txt.read
txt.close()

#We ask for another user input, same filename.
print "Type the filename again: "
#we get the filename from user input and assign the string to a variable
file_again = $stdin.gets.chomp

#We open the same file again using the previous variable value, and assign the content to a new variable.
txt_again = open(file_again)

#we print out the content of the file AFTER reading the content using .read
#Note: read does not print to the screen, it just reads the file.
print txt_again.read
txt_again.close()
