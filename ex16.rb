filename = ARGV.first

puts "We're going to erase #{filename}"
puts "If you don't want that, hit CTRL-C(^C)."
puts "If you do want that, hit RETURN."

$stdin.gets

#open will always default to READ MODE, that's why we need to specify the 'w' for WRITE MODE
puts "Opening the file..."
target = open(filename, 'w')

#truncating a file will erase the contents of the file from specified argument. More info on OneNote notes.
puts "Truncating the file. Goodbye!"
target.truncate(0)

puts "Now I'm going to ask you for three lines."

print "line 1: "
line1 = $stdin.gets.chomp
print "line 2: "
line2 = $stdin.gets.chomp
print "line 3: "
line3 = $stdin.gets.chomp

puts "I'm going to write these to the file."


=begin
#We are using variables for the writing input, which is why we can't use the \n in the same .write
target.write(line1)
target.write("\n")
target.write(line2)
target.write("\n")
target.write(line3)
target.write("\n")
=end

#We can also just use one .write line as follows: (this is my own doing)
target.write("#{line1}\n#{line2}\n#{line3}\n")

#closing files is important.
puts "And finally, we close it."
target.close
