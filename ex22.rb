# This is a comment, done with starting the line with # (octothorp)

puts "Hello " #"puts" prints out with a new line \n

# {} are called curly brackets, " double quote, ' single quote, () parenthesis, % percentage
# + plus, - minus, * asterisk, / slash, \ backslash, < less than, > more than, = equal
# integer= whole numbers, floating point= decimal number
# writing x += y is another way of writing x = x + y

var = "World." #variable "var" being assigned a value (could be a number, string, or more)

puts "#{var}", "Commas can be used to output more with puts or print" # #{} is used to output variable value or do math inside it to output a result.

#boolean = a value that can either be true or false, THESE ARE NOT strings

print 5 + 6 , " Just printed an operation using print" # print is the same as puts, except no new line is set after using it.
print "\n" # prints a new line
# formatting used with %{} will format values the way we want, example:
formatter = "%{first}, Hey there"
puts formatter % {first: "Arnold"} # Outputs "Arnold, Hey there", values can be strings, numbers, booleans...

=begin
Using a backslash with certain characters creates something called escape sequences.
Here's a list of what each escape sequence does:
\n = new line
\" = writes one Double quote
\' = writes one Single quote
\\ = writes one backslash
\t = Tabs one space to the right
\v = Tabs one vertical space to the next line
\b = ASCII Backspace
\a = ASCII bell sound
\ooo = character with octal value ooo
\f = Formfeed
\r = Carriage return
\uxxxx = hexadecimal character 16 bit
\xhh = character with hex value
=end

#Using triple double quote will make it so we don't have to use certain escape sequences in strings.
#They also will be output in the same format as they have been coded, meaning that the screen will output the same text in the same order as below
puts """
    -----------------------------------------
    Hello, these are double quotes ""
    These are single quotes '''
    We are all inside a triple quote string.
    -----------------------------------------
"""

# %q is used as an alternative to using '' single quotes for the string.
# %Q is used as an alternative to using "" double quotes for the string.
# Useful for escaping HTML with JavaScript when ran out of quoting methods.
puts %q{Hello, this is a %q{} usage.}
puts %Q{Hello, this is a %Q{} usage.}

=begin
Methods we have used so far:

gets.chomp = used for getting keyboard input, chomps erased a \n that's created when hitting return using gets
to_i = converts to integer format
to_f = converts to floating format
to_s = converts to string format
=end

=begin

When running a script through the terminal, we can pass arguments to it.
We can get those arguments using ARGV inside our script, otherwise the arguments are lost.
For example:
$ruby ex13-1.tb tee coff si lea

^ ARGV will get these 4 arguments^
we can then assign those arguments to variables
teeth, coffee, sit, learn = ARGV # arguments will be passed and assigned from left to right in order

Another way of assigning would begin

teeth = ARGV.first
coffee = ARGV.second
...
=end

fun = $stdin.gets.chomp # $stdin is added to gets.chomp calls in case we are using ARGV in our script, otherwise gets.chomp causes issues.

=begin
Following methods are found in hte IO Class.

Opening files works in the following way:

We can use open("filename") to open a file where filename is the name of said file.
Another way would be using File.open("filename"), both are correct.
When we open a file and assign said opening to a variable, we have created a File Object.
For example:
txt = open("file.txt")

open defaults to readmode when opening a file, we can specify the mode we want as shown below:
open("filename", 'r') # options for modes are r, w, a, r+, w+, a+ and b(binary)

We can now use several methods on this object.
txt.read = reads the content of the file.
txt.write = writes inside the file
txt.truncate() = empties the file content based on the argument given
txt.seek() = moves the "cursor" location for read/write operations to the position set as an argument
txt.readline = reads just one line.
txt.exist? = checks if the file exists, will return a boolean.
txt.close = closes the file, important!

If we call gets.chomp to the txt object, we will get the first line, and then the cursor that reads/writes will be moved to the next line.

=end

# This is a colon : and this is a semi-colon ;
#We can put more than one command in a single line using semi-colons. We can use as many commands as we want in one line.
puts "Command1 before semicolon " ; print "Command2 after semicolon \n"

#Functions/methods are mini-scripts that execute their code when called.
def method(*args) # def stands for "define", it creates a mini-script that can take arguments the same way our regular scripts can.
  puts "Method code: #{args}" #between def and end, we can write whatever code we want
end # end is used to indicate the end of our method/function

#functions/methods can then be called by writing their name and passing arguments(if any are needed by the method)
# we can pass anything we want as an argument, Objects, operations, methods, etc...
method("Called method, argument passed to function/method")

#the word "return" will return whatever value we set to be returned after a function/method is called, for example:
def valuereturn
  puts "Code inside function, now comes the return value: "
  return puts "Hey, I'm the return value, I just wrote return puts \"blabla\""
end

valuereturn
