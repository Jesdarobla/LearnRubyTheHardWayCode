ten_things = "Apples Oranges Crows Telephone Light Sugar"

puts "Wait there are not 10 things in that list. Let's fix that"

stuff = ten_things.split(' ') # split(ten_things, ' ')

more_stuff = ["Day","Night","Song","Frisbee","Corn","Banana","Girl","Boy"]

# using math to make sure there's 10 items

while stuff.length != 10 # lenght(stuff)
  next_one = more_stuff.pop # pop(more_stuff)
  puts "Adding: #{next_one}"
  stuff.push(next_one) # push(stuff, next_one)
  puts "There are #{stuff.length} items now." #lenght(stuff)
end

puts "There we go: #{stuff}"

puts "Let's do some things with stuff."

puts stuff[1]
puts stuff[-1]
puts stuff.pop() # pop(stuff)
puts stuff.join(' ') # join(stuff, ' ')
puts stuff[3..5].join("#") # join(stuff[3..5], "#")


puts "\n---------------------------------------------------"


=begin
10 examples of irl things that would fit in an array

1. A school case.
2. A woman's purse
3. A sink with types of dishes
4. A Footbal court with numbered players
5. A building with named people inside
6. The number and name of games in a shelf
7. The number of bottles of wine in a cellar
8. Food types in a pantry
9. The different kind of paper you might find in a paper store
10. The different types of kitchen cutlery you might find in a drawer

=end


=begin
I am tasked with searching and understanding what OOP is and how it works, along with what a "class" is in Ruby.

Notes:

OOP is a programming paradigm(a model) that relies on "classes" and "objects".
It uses reusable code blocks (classes)for that.
These blocks create individual instances of objects.
Classes have attributes, like variables and methods, that will be inherited by the object.
Objects can have their own methods + their inherited ones.

Classes in Ruby are something called "First-Clas objects", they are an instance of the class "Class"

=end
