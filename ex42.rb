=begin


    -Research why Ruby added this strange object class and what that means.
    -Is it possible to use a class like it's an object?
    -Fill out the animals, fish, and people in this exercise with functions that make them do things. See what happens when functions are in a "base class" like Animal versus in, say, Dog.
    -Find other people's code and work out all the is-a and has-a relationships.
    -Make some new relationships that are arrays and hashes so you can also have "has-many" relationships.
    -Do you think there's such thing as an "is-many" relationship? Read about "multiple inheritance," then avoid it if you can.


=end

## Animal is-a object look at the extra credit
## classes are also objects of the class "Class", they are first-class objects.
class Animal

  def breathe
    puts "Animal breathes."
  end

end

## Dog is-a Animal
class Dog < Animal

  def initialize(name)
    #Dog has-a name
    @name = name
  end
  def bark(atwhat)

    @atwhat = atwhat
    puts "#{@name} barks at #{@atwhat}"

  end
end

## Cat is-a Animal
class Cat < Animal

  def initialize(name)
    ## Cat has-a name
    @name = name
  end
  def meow
    puts "#{@name} meows at nothing."
  end
end

## Person is-a class
class Person

  def initialize(name)
    ## Person has-a name
    @name = name

    #Person has-a pet of some kind
    @pet = nil
  end
  def speak
    puts "#{@name} speaks"
  end
  attr_accessor :pet
end

## Employee is-a Person
class Employee < Person

  def initialize(name, salary)
    ## super will call the parent class Person in this case, and since Person has an initialize that requires a name, we pass a name
    super(name)
    ## Employee has-a salary
    @salary = salary
  end

end

## Fish is-a class
class Fish
end

## Salmon is-a Fish
class Salmon < Fish
end

## Halibut is a Fish
class Halibut < Fish
end

## rover is-a Dog
rover = Dog.new("Rover")

## satan is-a cat
satan = Cat.new("Satan")

## mary is-a Person
mary = Person.new("Mary")

## Mary's has-a pet Cat named satan
mary.pet = satan

## frank is-a Employee
frank = Employee.new("Frank", 120000)

## frank's has-a pet Dog named rover
frank.pet = rover


## Flipper is-a Fish
flipper = Fish.new()

## crouse is-a Salmon
crouse = Salmon.new()

## harry is-a Halibut
harry = Halibut.new()


########################################

puts rover.breathe(), rover.bark("another dog")

puts frank.pet, frank.speak

## this dog has many names

manynames = Dog.new(["Forossa", "Thesos", "Miranda"])

puts manynames.breathe, manynames.bark("at other manydogs")

manykeys = Cat.new({"M" => "Max", "F" => "Fanso", "D" => "Dragoon"})

puts manykeys.breathe, manykeys.meow
