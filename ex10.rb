=begin
tabby_cat = "\tI'm tabbed in."
persian_cat = "I'm split\non a line."
backslash_cat = "I'm \\ a \\ cat."

fat_cat = """
 I'll do a list:
 \t* Cat food
 \t* Fishies
 \t* Catnip\n\t* Grass
 """

 puts tabby_cat
 puts persian_cat
 puts backslash_cat
 puts fat_cat
=end

 # From here on these are tests and study drills.

#Using escape sequences allows us to do certain things inside strings
#A list of all sequences can be found in my OneNote notes.
 tabby_cat = "\tI'm tabbed in."
 persian_cat = "I'm split\non a line."
 backslash_cat = "I'm \\ a \\ cat."

# using triple quotes allows us to use single quotes inside strings without the need of a escape sequence
 fat_cat = """
  I'll do a list:
  \t* Cat food
  \t* Fishies
  \t* Catnip\n\t* Grass
  """
# When using Triple single quotes, most of the escape sequences don't work except \' and \\
# double quotes don't need to use the escape sequence to be added
# also note that #{} does not work with single quotes, don't forget
skinny_cat = '''
  I\'ll need to get:
  \\ Healthy food
  \\ Double-quotes "
  #{}
  '''

  puts tabby_cat
  puts persian_cat
  puts backslash_cat
  puts fat_cat
  puts skinny_cat

convoluted_cat = "I need to buy some %{a}, %{b}, %{c} and a bit of %{d} "

  puts convoluted_cat % {a: "\fMilk", b: "\tYoghurt", c: "\fMeat", d: "\'Salt\'"}
