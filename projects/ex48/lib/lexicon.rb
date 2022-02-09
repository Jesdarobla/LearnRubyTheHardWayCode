class Lexicon

  def self.scan(x)
    result, lexicon, words = [], [], x.split
    directions = ["north","south","east","west","up","down","left","right"]
    verbs = ["kill","go","eat","sleep","play","talk", "run"]
    stops = ["in","the","of","a","an","at"]
    nouns = ["bear", "princess","knife","table","man"]
    lexicon = lexicon.concat(directions, verbs, stops, nouns)
    words.each { |word|
        downcased = word.downcase #assuming we don't care if returned word is downcased
        if lexicon.include? downcased
          if directions.include? downcased
            result.push(["direction", downcased]) #push word instead if you want to keep original capitalization
          end
          if verbs.include? downcased
            result.push(["verb", downcased])
          end
          if stops.include? downcased
            result.push(["stop", downcased])
          end
          if nouns.include? downcased
            result.push(["noun", downcased])
          end
        elsif Float(word, exception:false) #turns number in string into float if possible, otherwise false
          result.push(["number", word.to_i])
        else
          result.push(["error", word])
          #else       #using exception to check if integer or not.
          #  begin
          #    Integer(word)
          #    result.push(["number", word.to_i])
          #  rescue
          #    result.push(["error", word])
          #  end
        end
        }
      return result
  end
end
