puts "let's practice everything."
puts 'You\'d need to know \'bout escapes with \\ that do \n newlines and \t tabs.'

#the <<END is a "heredoc". See Student Questions. It is used to create a multi-line string and you use it by starting with << and an all caps word.
#In this case the all caps word is END, Ruby then reads everything into a string until it sees another END. You can use any word instead of END.
poem = <<END #this string also includes all identation.
\tThelovely world
with logic so firmly planted
cannot discern \n the needs of love
nor comprehend passion from intuition
and requires an explanation
\n\t\twhere there is none.
END

puts "--------------"
puts poem
puts "--------------"

five = 10 - 2 + 3 - 6
puts "This should be five: #{five}"

def secret_formula(started)
    jelly_beans = started * 500
    jars = jelly_beans / 1000
    crates = jars / 100
    return jelly_beans, jars, crates #returning 3 values
end

start_point = 10000
#since we know secret_formula returns 3 values, we assign those to these variables.
beans, jars, crates = secret_formula(start_point)

puts "With a starting point of: #{start_point}"
puts "We'd have #{beans} beans, #{jars} jars, and #{crates} crates."

start_point = start_point / 10
puts "We can also do that this way:"
#this is another way of formatting strings, used by many other languages, such as C.
puts "We'd have %s beans, %d jars, and %d crates" % secret_formula(start_point)
