teeth, coffee, sit, learn = ARGV

print "What do you usually do for fun? "
#$stdin is used when mixing gets.chomp and ARGV in the same file because they have problems with each other.
fun = $stdin.gets.chomp

print "How frequently do you play videogames? "

vidya = $stdin.gets.chomp

puts "So you wake up and brush your #{teeth}, then go to the kitchen and make a #{coffee}, then #{sit} of your computer and start to #{learn} anything. \nHowever you also #{fun} for fun and play videogames this frequently: #{vidya}"
