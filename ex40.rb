=begin
class Song
  def initialize(lyrics)
    @lyrics = lyrics
  end

  def sing_me_a_song()
    @lyrics.each {|line| puts line}
  end
end

happy_bday = Song.new(["Happy birthday to you","I don't want to get sued","So I'll stop right there"])

bulls_on_parade = Song.new(["They rally around tha family","With pockets full of shells"])

happy_bday.sing_me_a_song()

bulls_on_parade.sing_me_a_song()

puts '-' * 20
release = "Feeling like I have no release"
freak_on_a_leash = Song.new(["Feeling like a freak on a leash.", release])

freak_on_a_leash.sing_me_a_song()

puts '-' * 20
compassion = "Such a lack of compassion"
make_me_bad = Song.new(["I am watching the rise and fall of my salvation", "There's so much shit around me", compassion])

make_me_bad.sing_me_a_song()

=end

class Song
  def initialize(lyrics)
    @lyrics = lyrics
  end

  def sing_me_a_song()
    @lyrics.each {|line| puts line}
  end

  def rate_the_song(rating)
    @rating = rating
  end

  def song_rating()
    @rating
  end

  def song_profanity_level(level)
    @level = level
  end

  def profanity_level()
    @level
  end

end

song = Song.new("Bad words.")
song.rate_the_song(10)
puts song.song_rating
song.song_profanity_level(8)
puts song.profanity_level
