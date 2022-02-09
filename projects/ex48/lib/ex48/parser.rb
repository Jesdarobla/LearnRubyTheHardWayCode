
=begin

In this block I have tried my own version of a parser, as a challenge as
mentioned in the book. Wht it does is get X number of sentences, returns them in
and array, and then we could use that array to create Sentence objects.



class ParseException < Exception
    def self.nope()
      return "Please input a verb and a noun/direction correctly."
    end
end

class SentencePrep

  attr_accessor :subject, :verb, :object

  def self.separate(pairs)
    @subject = []
    @verb = []
    @object = []

      pairs.each{ |pair|
        if pair[0] == "verb"
          @verb.push(pair[1]);end
        if pair[0] == "noun"
          @object.push(pair[1]);end
        if pair[0] == "direction"
          @object.push(pair[1]);end
        if pair[0] == "direction"
          @object.push(pair[1]);end
        }

      if @verb.length == @object.length
        sentences = []
        n = 0
        @verb.each { |verb|
          sentences.push([verb, @object[n]])
          n = n + 1
        }
        return sentences

      else
        ParseException.nope
      end
  end

end

class Sentence

  attr_reader :verb, :object

  def initialize(sentence)
    @sentence = sentence
    @verb = @sentence[0]
    @object = @sentence[1]
  end

end

=end

#Now for the version of the parser the book shows.

class ParserError < Exception
end

class Sentence

    def initialize(subject, verb, obj)

      # we take ['noun', 'princess'] as pairs
      @subject = subject[1]
      @verb = verb[1]
      @object = obj[1]

    end

    attr_reader :subject, :verb, :object
end

module ParserMethods

  def self.peek(word_list)
    if word_list
        word = word_list[0]
        return word[0]
    else
      return nil
    end
  end

  def self.match(word_list, expecting)
    if word_list
      word = word_list.shift

      if word[0] == expecting
        return word
      else
        return nil
      end

    else
      return nil
    end
  end

  def self.skip(word_list, word_type)
    while peek(word_list) == word_type
      match(word_list, word_type)
    end
  end
  def self.parse_verb(word_list)

    skip(word_list, 'stop')
    if peek(word_list) == 'verb'
        return match(word_list, 'verb')
    else
        raise ParserError.new("Expected a verb next.")
    end

  end

  def self.parse_object(word_list)
    skip(word_list, 'stop')
    next_word = peek(word_list)

    if next_word == 'noun'
        return match(word_list, 'noun')
    elsif next_word == 'direction'
      return match(word_list, 'direction')
    elsif next_word == 'number'
      return match(word_list, 'number')
    else
      raise ParserError.new("Expected a noun or direction next.")
    end

  end


  def self.parse_subject(word_list)
    skip(word_list, 'stop')
    next_word = peek(word_list)

    if next_word == 'noun'
        return match(word_list, 'noun')
    elsif next_word == 'verb'
      return ['noun', 'player']
    else
      raise ParserError.new("Expected a verb next.")
    end
  end

  def self.parse_sentence(word_list)
    subj = parse_subject(word_list)
    verb = parse_verb(word_list)
    obj = parse_object(word_list)

    return Sentence.new(subj, verb, obj)

  end




end
