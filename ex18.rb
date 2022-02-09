#def for "define"
#*args is a lot like ARGV, not used unless specifically needed.
def print_two(*args)
  arg1, arg2 = args
  puts "arg1: #{arg1}, arg2: #{arg2}"
end
#ok, that *args is actually pointless, we can just do this

def print_two_again(arg1, arg2)
  puts "arg1: #{arg1}, arg2: #{arg2}"
end

def print_one(arg1)
  puts "arg1: #{arg1}"
end

#this one takes no arguments
def print_none()
  puts "I got nothin'."
end

print_two("Jesda","Robla")
print_two_again("Jesda","Robla")
print_one("First!")
print_none()
