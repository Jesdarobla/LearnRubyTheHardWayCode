from_file, to_file = ARGV

puts "Copying from #{from_file} to #{to_file}"

#we could do these two on one line, how?
=begin
in_file = open(from_file)
indata = in_file.read
=end
#Like this:
indata = open(from_file).read #Alternatively File.read(from_file)

puts "The input file is #{indata.length} bytes long"

#We use the exist? funcion/method from File Class to ask if the filename found in "to_file" exists, and it will return a boolean.
puts "Does the output file exist? #{File.exist?(to_file)}"
puts "Reader, hit RETURN to continue, CTRL-C to abort."
$stdin.gets

out_file = open(to_file, 'w') #Alternatively write(to_file, indata)
out_file.write(indata)

puts "Alrigh, all done."

=begin
The reason why we need to write out_file.close but not in_file.close (if active) is because out_file is a File object.
When we open a file and assign it to a variable, we are assigning a File object instead of a string taken from just using the read method.
This means that doing in_file.close is incorrect, because in_file is not actually a File object, its a string. Strings don't need to be closed.
=end
out_file.close
#in_file.close

#read, new and write come from the IO class, File is a subclass of SuperClass? Added to Learn more.
