#class for Player object
class Player

  #initialize @inventory as array for array methods to work in action functions
  #we also initialize the hidden status of player
  def initialize
    @inventory = ["Small key"]
    @hidden = false
    @currentRoom
  end

  #for getting the hidden status
  def hidden
    @hidden
  end

  #to modify the hidden status
  def hidden=(x)
    @hidden = x
  end

  def inventory #needed to call the inventory instance variable
    @inventory
  end

  def inventoryCheck()
    puts "Items in your inventory: \n#{@inventory}"
  end

  def currentRoom
    @currentRoom
  end

  def currentRoom=(x)
    @currentRoom = x
  end

end

#class for monster object
class Monster

  def initialize
    @currentRoom
  end

  def currentRoom=(x)
    @currentRoom = x
  end

  def currentRoom
    @currentRoom
  end

  def killPlayer()
    puts "The monster attacks and kills the player, who's unable to defend."
    dead()
  end

  def monsterMove(monsterObj, roomObj)
    puts "The monster moves to the #{roomObj.name}"
    monsterObj.currentRoom = roomObj
    print "\n"
    puts "The monster is now in: #{monsterObj.currentRoom.name}"
  end

end

class Room

  #all rooms share these characteristics
  #there are items in them, have locked doors and have hiding spots
  def initialize
    @roomItems = {}
    @lockedDoor = false
    @hidingSpots = []
    @name
    @noiseLevel
    @hasAccessTo = []
  end

  def roomItems
    @roomItems
  end

  #the room has a lockedDoor that needs be open using small keys or a crowbar
  def lockedDoor
    @lockedDoor
  end

  def lockedDoor=(x)
    @lockedDoor = x
  end

  def hidingSpots
    @hidingSpots
  end

  def name
    @name
  end

  def noiseLevel
    @noiseLevel
  end

  def noiseLevel=(x)
    @noiseLevel = x
  end

  def hasAccessTo
    @hasAccessTo
  end

end

class Kitchen < Room

  def initialize
    @roomItems = {
      "Strange looking keys" => "Small key",
      "Dusty Box" => "Lighter",
      "Drawer" => "Spoon"
    }
    @hidingSpots = ["Cabinet","Old fridge"]
    @name = "Kitchen"
    @lockedDoor = true
    @hasAccessTo = ["Pantry", "Corridor"]
  end

end

class Pantry < Room

  def initialize
    @roomItems = {
      "Can of tuna" => "Tuna",
      "Can of beans" => "Beans",
      "Can of cans" => "Small key"
    }
    @hidingSpots = ["Empty adult sized can"]
    @name = "Pantry"

    @hasAccessTo = ["Kitchen"]
  end

end

class Corridor < Room

  def initialize
    @roomItems = {
      "Weird looking tool" => "Hammer",
      "Big Box" => "Locker",
      "Chopping tool" => "Axe"
    }
    @hidingSpots = ["Old cupboard"]
    @name = "Corridor"
    @corridorDoors = {
      "Basement door" => "Basement",
      "Living room door" => "Living Room",
      "Attic door" => "Attic",
      "Garage door" => "Garage",
      "Bedroom door" => "Bedroom",
      "Main entrance" => "Main entrance",
      "Bathroom door" => "Bathroom"
    }
    @hasAccessTo = ["Kitchen", "Garden", "Bedroom", "Bathroom", "Living Room",
    "Basement", "Attic", "Garage"]
  end

  def corridorDoors
    @corridorDoors
  end

end

class Garden < Room

  def initialize
    @roomItems = {
      "Rusty tool" => "Crowbar",
      "Set of keys" => "Small key"
    }
    @hidingSpots = ["Shed", "Dog house"]
    @name = "Garden"
    @hasAccessTo = ["Corridor"]
  end

end

class Bedroom < Room

  def initialize
    @roomItems = {
      "Pretty box" => "Scissors",
      "Piled up keys" => "Small key"
    }
    @hidingSpots = ["Wardrobe", "Bed underside"]
    @name = "Bedroom"
    @hasAccessTo = ["Corridor"]
  end

end

class LivingRoom < Room

  def initialize
    @roomItems = {
      "Old drawers" => "Crowbar",
      "Old Sofa" => "Dull knife",
      "Big table" => "Spoon",
      "Rotten animal corpse" => "Unopened tuna can"
    }
    @hidingSpots = ["Old sofa"]
    @name = "Living Room"

    @hasAccessTo = ["Corridor"]
  end

end

class Bathroom < Room

  def initialize
    @roomItems = {
      "Shampoo bottle" => "Small key",
      "Stained toilet" => "Stained toilet paper"
    }
    @hidingSpots = ["Cabinet","Old fridge"]
    @name = "Bathroom"

    @hasAccessTo = ["Corridor"]
  end

end

class Garage < Room

  def initialize
    @roomItems = {
      "Toolshed" => "Crowbar",
      "Broken car" => "Bloody Knife",
      "Dead mouse" => "Small key",
    }
    @hidingSpots = ["Broken car"]
    @name = "Garage"

    @hasAccessTo = ["Corridor"]
  end

end

class Attic < Room

  def initialize
    @roomItems = {
      "Shining glimpse under bed" => "Ornament key",
      "Rusted keychain" => "Rusted key",
    }
    @hidingSpots = ["Huge box"]
    @name = "Attic"

    @hasAccessTo = ["Corridor"]
  end

end

class Basement < Room

  def initialize
    @roomItems = {
      "Shoe box" => "Small key",
      "Broken glass" => "Trash",
      "Unlocked Safe" => "Old paper"
    }
    @hidingSpots = ["Unlocked Safe","Stairs underside"]
    @name = "Basement"

    @hasAccessTo = ["Corridor"]
  end

end
