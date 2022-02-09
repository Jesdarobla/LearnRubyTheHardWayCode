filename = ARGV.first

file = open(filename)

print "Reading file passed as argument...","\n" ,file.read
