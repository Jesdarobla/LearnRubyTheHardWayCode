#We create a variable cars and assign it a value to say we have 100 cars, for example
cars = 100
#We create a variable space_in_a_car and assign it a value that specifies the number of seats
space_in_a_car = 4
#We create a variable drivers and assign it a value to say there are 30 drivers
drivers = 30
#We create a variable passengers to say we have 90 passengers
passengers = 90
#Another variable called cars_not_driven, that does a simple operation by substracting the number
# of cars compared to the number of drivers
cars_not_driven = cars - drivers
#We create a variable called cars_driven that assigns the drivers variable value to the cars_driven variable
cars_driven = drivers
#The following variable will calculate the total capacity of the carpool by
# multiplying the number of driven cars by the space in a car
carpool_capacity = cars_driven * space_in_a_car # 30 cars driven with 4 spaces for each car
#The following variable will calculate the average passengers per car by dividing the total number of
# passengers by the number of cars driven
average_passengers_per_car = passengers / cars_driven

#We say how many cars there are available
puts "There are #{cars} cars available."
#We specify how many drivers there are available
puts "There are only #{drivers} drivers available."
#We say how many cars will not be driven today
puts "There will be #{cars_not_driven} empty cars today."
#We specify the number of people we can transport today
puts "We can transport #{carpool_capacity} people today."
#We output how many passengers there is today
puts "We have #{passengers} to carpool today."
#We specify the number of passengers for each car.
puts "We need to put about #{average_passengers_per_car} in each car."
