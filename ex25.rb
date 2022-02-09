module Ex25  # Modules are a way of grouping methods, classes and constants. 
#We can use "require" in other script or irb in order to call this module and we can use the functions/methods defined here withotu having to define them again in another file or in irb.

  # This function will break up words for us.
  def Ex25.break_words(stuff)
    words = stuff.split(' ') #split is a method from the String Class used to split the string into an array based on the specified pattern(regex or string can be used)
    return words
  end

  # Sorts the words.
  def Ex25.sort_words(words)
    return words.sort # Array Class method that returns the array sent in alphabetical order
  end

  # Prints the first word after shifting it off.
  def Ex25.print_first_word(words)
    word = words.shift # Array Class method that removes the first element from the array and returns it.
    puts word
  end

  # Prints the last word after popping it off.
  def Ex25.print_last_word(words)
    word = words.pop # Array class method, removes and returns the last element from the array.
    puts word
  end

  # Takes in a full sentence and returns the sorted words.
  def Ex25.sort_sentence(sentence)
    words = Ex25.break_words(sentence)
    return Ex25.sort_words(words)
  end

  #Prints the first and last words of the sentence.
  def Ex25.print_first_and_last(sentence)
    words = Ex25.break_words(sentence)
    Ex25.print_first_word(words)
    Ex25.print_last_word(words)
  end

  # Sorts the words then prints the first and last one.
  def Ex25.print_first_and_last_sorted(sentence)
    words = Ex25.sort_sentence(sentence)
    Ex25.print_first_word(words)
    Ex25.print_last_word(words)
  end

end
