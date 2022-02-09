# Inheritance demo
class Parent

#setup of functions that will be used to demostrate inheritance.
  def override()
    puts "PARENT override()"
  end
#implicit will not be present in the Child class, so calling implicit() from Child will call PARENT implicit()
  def implicit()
    puts "PARENT implicit()"
  end

  def altered()
    puts "PARENT altered()"
  end
end

class Child < Parent

#override() in Child, when calling override() from Child object, it will call the Child override(), NOT the Parent one.
  def override()
    puts "CHILD override()"
  end
#altered() in Child, when calling altered(), it will execute all code till super, super will then search and execute (if there is any) the altered() from Parent, afterwards it returns to Child altered.
  def altered()
    puts "CHILD, BEFORE PARENT alreded()"
    super()
    puts "CHILD, AFTER PARENT altered()"
  end
end

dad = Parent.new()
son = Child.new()

dad.implicit()
son.implicit()

dad.override()
son.override()

dad.altered()
son.altered()

#############################################################################

module Other
  def override()
    puts "OTHER override()"
  end

  def implicit()
    puts "OTHER implicit()"
  end

  def Other.altered() # we use Other.altered() to avoid issues with same name functions from other classes.
    puts "OTHER altered()"
  end
end

class Child
  include Other
  def override()
    puts "CHILD override"
  end

  def altered()
    puts "CHILD, BEFORE OTHER altered()"
    Other.altered() # we must call the Other.altered here if we want the Other.altered function, otherwise it will call the same function inside Child again, which we don't want.
    puts "CHILD, AFTER OTHER altered()"
  end
end

son = Child.new()

son.implicit()
son.override()
son.altered()


=begin
Inheritance vs Composition
If both solutions solve the problem of reuse, then which one is appropriate in which situations? The answer is incredibly subjective, but I'll give you my three guidelines for when to do which:

    Avoid something called "meta-programming" at all costs, as it is too complex to be useful reliably. If you're stuck with it, then be prepared to know the class hierarchy and spend time determining where everything is coming from.
    Use composition to package up code into modules that are used in many different unrelated places and situations.
    Use inheritance only when there are clearly related reusable pieces of code that fit under a single common concept or if you have to because of something you're using.

Do not be a slave to these rules. The thing to remember about object-oriented programming is that it is entirely a social convention programmers have created to package and share code. Because it's a social convention, but one that's codified in Ruby, you may be forced to avoid these rules because of the people you work with. In that case, find out how they use things and then just adapt to the situation.
=end
