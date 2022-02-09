
def wloop(loop, incre)
  i = 0
  numbers = []
  while i < loop
    puts "At the top i is #{i}"
    numbers.push(i)

    i += incre
    puts "Numbers now: ", numbers
    puts "At the bottom i is #{i}"
  end

  puts "The numbers: "

  # remember you can write this 2 other ways?
  numbers.each {|num| puts num}
end

puts " -----------------------------------"
wloop(5, 2)
puts " -----------------------------------"

def floop

  numbers = []
  for i in (0..6)
    puts "At the top i is #{i}"
    numbers.push(i)
    i += 1
    puts "Numbers now: ", numbers
    puts "At the bottom i is #{i}"
  end

  puts "The numbers: "

  # remember you can write this 2 other ways?
  numbers.each {|num| puts num}
end

puts " -----------------------------------"
floop
puts " -----------------------------------"
