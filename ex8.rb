# We are assigning a variable with a string that contains formatting syntax %{}
# the values inside %{} can be changed to map a different value. More info below.
formatter = "%{first} %{second} %{third} %{fourth}"

#When we output the formatter variable,, we are outputing the string above.
#In order to change the %{first}, %{second}, ... into something else, we do as shown below.
# We use the % character followed by {} in the same manner, but this time we specify the values that we want the strings to output.
# In the line below, we are saying that %{first} needs to output 1, %{second} needs to output 2, etc...
#Note: The string will be printed without the %{} characters, meaning a 1 will be printed instead of a %{1}.
puts formatter % {first: 1, second: 2, third: 3, fourth: 4}
# Same as above, but with strings instead of numbers.
puts formatter % {first: "one", second: "two", third: "three", fourth: "four"}
# Same as above, except with booleans
puts formatter % {first: true, second: false, third: true, fourth:false}
# Same as previous examples, except this time we specify a variable to be the output.
# Note: this means that in this case, the string that the variable formatter has will be repeated 4 times as it is.
puts formatter % {first: formatter, second: formatter, third: formatter, fourth: formatter} # For a better understanding, execute the file and see how it behaves

#Below we can find another way to write the formatting of the strings, but separating each value in a different line for clarity.
puts formatter % {
    first: "I had this thing.",
    second: "That you could type up right.",
    third: "But it didn't sing.",
    fourth: "So I said goodnight."
}
