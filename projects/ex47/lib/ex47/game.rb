
class Monster

  def initialize
    @currentRoom
  end

  attr_accessor :currentRoom

  def killPlayer()
    return "The monster attacks and kills the player, who's unable to defend."
  end

  def monsterMove(monsterObj, room)
    monsterObj.currentRoom = room
  end

end


=begin

class Room

  def initialize(name, description)
    @name = name
    @description = description
    @paths = {}
  end

  #these make it easy for you to access the variables
  attr_reader :name
  attr_reader :paths
  attr_reader :description

  def go(direction)
    return @paths[direction]
  end

  def add_paths(paths)
    @paths.update(paths)
  end

end

=end
