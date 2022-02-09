# Hashes are used for mapping a key to a value, like a custom dictionary.
=begin
# Create a mapping of state to abbreviation
states = {
  'Oregon' => 'OR',
  'Florida' => 'FL',
  'California' => 'CA',
  'New York' => 'NY',
  'Michigan' => 'MI',
}

# create a basic set of states and some cities in them

cities = {
  'CA' => 'San Francisco',
  'MI' => 'Detroit',
  'FL' => 'Jacksonville',
}

# add some more cities
cities['NY'] = 'New York'
cities['OR'] = 'Portland'

#puts out some cities
puts '-' * 10
puts "NY State has: #{cities['NY']}"
puts "OR State has: #{cities['OR']}"

#puts our some states
puts '-' * 10
puts "Michigan's abbreviation is: #{states['Michigan']}"
puts "Florida's abbreviation is: #{states['Florida']}"

#do it by using the state then cities dict
puts '-' * 10
puts "Michigan has: #{cities[states['Michigan']]}"
puts "Florida has: #{cities[states['Florida']]}"

#puts every state abbreviation
puts '-' * 10
states.each do |state, abbrev|
  puts "#{state} is abbreviated #{abbrev}"
end

# puts every city in state
puts '-' * 10
cities.each do |abbrev, city|
  puts "#{abbrev} has the city #{city}"
end

#now do both at the same time
puts '-' * 10
states.each do |state, abbrev|
  city = cities[abbrev]
  puts "#{state} is abbreviated #{abbrev} and has city #{city}"
end

puts '-' * 10
#by default ruby says "nil" when something isn't in there
state = states['Texas']

if !state
  puts "Sorry, no Texas."
end

#default values using ||= with the nil result
city = cities['TX']
city ||= 'Does Not Exist'
puts "The city for the state 'TX' is: #{city}"
=end


# Provinces in my country
provinces = {
  'León' => 'LE',
  'Valladolid' => 'VLD',
  'Orense' => 'OU',
  'Oviedo' => 'OV',
  'Valencia' => 'VL'
}

capitales = {
  'LE' => 'León',
  'VLD' => 'Valladolid',
  'OU' => 'Orense',
  'OV' => 'Oviedo',
  'VL' => 'Valencia'
}

provinces.each do |prov, abbrev|
  maincity = capitales[abbrev]
  puts "The province #{prov} abbreviature is #{abbrev} and its main city is #{maincity}"
end

#Now we test some methods and tools for Hashes

puts '-' * 10; puts "Comparing province and capitales hashes: "
puts provinces == capitales

puts '-' * 10; puts "We set a default value for provinces: "
provinces.default = 'Provincia'; puts provinces.default #we set the default value for it in case there are no values, then we print the default value.

puts '-' * 10; puts "The number of elements(key and value together) in provinces hash is #{provinces.length}"

puts '-' * 10; puts "Turning hash to a string: #{provinces.to_s}"

puts '-' * 10; puts "Sorting? hash: #{provinces.sort}" #this turns hash to ARRAY and sorts it, hashes can't be sorted
