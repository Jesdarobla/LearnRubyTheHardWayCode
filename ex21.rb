def add(a, b)
  puts "ADDING #{a} + #{b}"
  return a + b #return will return whatever value we ask it after the function has been finished(it finishes when return is run)
end

def substract(a, b)
  puts "SUBSTRACTING #{a} - #{b}"
  return a - b
end

def multiply(a, b)
  puts "MULTIPLYING #{a} * #{b}"
  return a * b
end

def divide(a, b)
  puts "DIVIDING #{a} / #{b}"
  return a / b
end

puts "Let's do some math with just functions!"

age = add(30, 5)
height = substract(78, 4)
weight = multiply(90, 2)
iq = divide(100, 2)

puts "Age: #{age}, Height: #{height}, Weight: #{weight}, IQ: #{iq}"

#A puzzle for the extra credit, type it in anyway.
puts "Here's a puzzle."

what = add(age, substract(height, multiply(weight, divide(iq, 2))))

puts "That becomes: #{what}. Can you do it by hand?"

=begin
f = (74 - ((50 / 2) * 180)) + 35
puts "Formula: #{f}"

x=divide(iq,2)
y=multiply(weight, x)
z=substract(height,y)
what= add(age,z)

puts "Result: #{what}"
=end
