require "ex47/game.rb"
require "test/unit"



class TestGame < Test::Unit::TestCase

  def test_monster()
    monsterObj = Monster.new()
    assert_equal(nil ,monsterObj.currentRoom)
    monsterObj.currentRoom = "Bedroom"
    assert_equal("Bedroom", monsterObj.currentRoom)
  end



  def test_monsterMovement()
    monsterObj = Monster.new()
    room = "Bedroom"
    assert_equal(nil, monsterObj.currentRoom)
    monsterObj.currentRoom = room
    assert_equal("Bedroom", monsterObj.currentRoom)
  end

  def test_killPlayer()
    monsterObj = Monster.new()
    assert_equal("The monster attacks and kills the player, who's unable to defend.", monsterObj.killPlayer)
  end

  def test_Rooms()

    unlockedRooms = {
      "Kitchen" => 1,
      "Corridor" => 2,
      "Garden" => 3,
    }
    lockedRooms = {
      "Bedroom" => 4,
      "Living Room" => 5,
      "Pantry" => 6,
      "Bathroom" => 7,
      "Garage" => 8,
      "Attic" => 9,
      "Basement" => 10
    }
    puts "[ #{lockedRooms.keys} ]"
    print "> "
    roomReturn = $stdin.gets.chomp.strip
    unlockedRooms[roomReturn] = lockedRooms[roomReturn]
    lockedRooms.delete(roomReturn)
    puts unlockedRooms
    print "\nLocked Rooms below\n"
    puts lockedRooms
    assert_equal(unlockedRooms.length, 4)

  end


end



=begin

class TestGame < Test::Unit::TestCase

  def test_room()
    gold = Room.new("GoldRoom",
                """This room has gold in it you can grab. There's a door to the north.""")
    assert_equal("GoldRoom",gold.name)
    assert_equal({}, gold.paths)
  end

  def test_room_paths()

    center = Room.new("Center", "Test room in the center.")
    north = Room.new("North", "Test room in the north.")
    south = Room.new("South", "Test room in the south")

    center.add_paths({'north'=> north, 'south'=> south})
    assert_equal(north, center.go('north'))
    assert_equal(south, center.go('south'))
  end

  def test_map()
    start = Room.new("Start", "You can go west and down a hole.")
    west = Room.new("Trees","There are trees here, you can go east.")
    down = Room.new("Dungeon", "It's dark down here, you can go up.")

    start.add_paths({'west' => west, 'down' => down})
    west.add_paths({'east' => start})
    down.add_paths({'up' => start})

    assert_equal(west, start.go('west'))
    assert_equal(start, start.go('west').go('east'))
    assert_equal(start, start.go('down').go('up'))
  end
end

=end
