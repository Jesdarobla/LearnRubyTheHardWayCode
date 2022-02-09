#Open a file
file = open("ex20_test.txt")

puts file.gets.chomp #using gets.chomp will get all input from first line. This moves the "cursor" to the next line.

puts file.gets.chomp #Since the "cursor" is in the second line, we get the second line as input.

file.seek(0) #Seek method will reset the "cursor" position back to the position you pass to it, in this case 0.

puts "resetted \"cursor\""

puts file.gets.chomp #After using .seek(0), this will be the first line again.

file.close() #closing the file will reset the cursor position too

puts "closed file"

file = open("ex20_test.txt") #Opening file to check cursor position

puts "opened file:"

puts file.gets.chomp # outputs line 1 instead of 3

puts file.gets.chomp # outpus line 2 as expected
