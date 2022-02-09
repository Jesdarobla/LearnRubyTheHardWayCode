#Here's some new strange stuff, remember to type it exactly.

#Assign a string containing days to a variable called days
days = "Mon Tue Wed Fri Sat Sun"
#Assign a string containing the months with a new line added between them
months = "Jan\nFeb\nMar\nApr\nMay\nJun\nJul\nAug"

#Print to the screen the following string with the variable days embedded to it.
puts "Here are the days: #{days}"
#Print to the screen the following string with the variable months embedded to it.
puts "Here are the months: #{months}"

#Printing a string to the screen, unsure how it works. Added to the _LearnMore.rb file.
#I have found out its use. It's a different way of using quotes.
# %q is used as an alternative to using '' single quotes for the string.
# %Q is used as an alternative to using "" double quotes for the string.
# Useful for escaping HTML with JavaScript when ran out of quoting methods.
puts %q{
  There's something going on here.
  With this weird quote
  We'll be able to type as much as we like.
  Even 4 lines if we want, or 5, or 6.
}
