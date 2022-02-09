

def dead()

  puts "You have been killed, and now your corpse will feed the monster."
  puts "BAD ENDING"
  exit(1)

end

#takeItem is flawed, for if every item has use of some sort, you'd always want
# to take without inspecting, since it makes no noise.
#ideas: take item will make a lot of noise all the time, or create useless items
# so taking without inspecting has bad results
def takeItem(playerObj, roomObj, item, inspected)

  #if the item is not inspected properly before being taken, you'll do a lot of
  #noise regarless of the item.
  if inspected == false
    if roomObj.roomItems.any?{ |key, value| key == item}

      revealedItem = roomObj.roomItems[item]
      puts "The #{item} turned out to be #{revealedItem}"
      sleep 1
      puts "Inserting #{revealedItem} to inventory..."

      roomObj.roomItems.delete_if{|key, value| value == revealedItem}

        #we add the item to the inventory array
      playerObj.inventory.push(revealedItem)


      puts "Taking the item without inspecting it first has made a lot of noise!"

      playerObj.currentRoom.noiseLevel = "High"
    end
  else
    if roomObj.roomItems.any?{ |key, value| key == item}

      puts "Inserting #{item} to inventory..."

      roomObj.roomItems.delete_if{|key, value| value == item}

        #we add the item to the inventory array
      playerObj.inventory.push(item)
    end
  end
end

def throwItem(playerObj, item, unlockedRooms)

  if item == "" || item == " "
    puts "Nothing was thrown."
    return
  end
  if playerObj.inventory.any?(item)

    puts "Where do you throw it?"
    playerObj.currentRoom.hasAccessTo.each { |x| if unlockedRooms.include?(x); puts "> #{x}"; end}
    choice = $stdin.gets.chomp.strip
    sleep 1
    if playerObj.currentRoom.hasAccessTo.include?(choice)

      puts "Throwing #{item} to #{choice}"
      #we get the index of the first match when searching the array for the passed
      #item name string
      itemIndex = playerObj.inventory.index(item)
      #puts "DEBUG: itemIndex value is: #{itemIndex}"
      #we delete the element found at the index where the first match is, deleting
      #that item from the array as we have thrown it away.
      playerObj.inventory.delete_at(itemIndex)
      return choice
    else
      puts "That's not a room."
    end
   else
     puts "That's not on your inventory"
   end

end

def inspectItem(playerObj, roomObj, item)

  print "\n"
  if item == "Main entrance"

    puts "Inspecting door..."
    sleep 1
    puts "The Main entrance requires a Big key to be opened."
    puts "You can't use a crowbar in this door, it's too bulky."

  elsif item == "Locked door" || item == "Locked doors"

    puts "Inspecting door/s..."
    sleep 1
    puts "The door/s require a small key to be opened."
    puts "You could also use a crowbar, but you'll cause a lot of noise."
  elsif item == "ornament locker" || item == "Ornament locker"
    puts "Seems like the locker cannot be opened with a regular Small key."
  elsif roomObj.roomItems.include?(item)
    #item should be the key of one of the items in the room hash
    puts "Inspecting item...#{item}"
    sleep 1
    inspectedItem =roomObj.roomItems[item] #set variable to value of given key
    puts "You found a #{inspectedItem} in the #{item}"
    #we add the previous found value as both key and value. Ex: {"x" => "x"}
    roomObj.roomItems[inspectedItem] = inspectedItem
    #we delete inspected item from the hash to now always show the inspected item
    roomObj.roomItems.delete_if{|key, value| key == item}

    #we now check the noise made by inspecting the item
    noisyItems = ["Spoon", "Fork", "Small key", "Can of cans", "Crowbar"]

    if noisyItems.any?(inspectedItem)
      puts "Inspecting this item has caused a lot of noise!"
      playerObj.currentRoom.noiseLevel = "High"
    else
      puts "Inspecting this item has made little noise.\n"
      playerObj.currentRoom.noiseLevel = "Low"
    end


    #we ask if we want to take said inspected item.
    print "\n"
    puts "Do you want to take the #{inspectedItem}?"
    answer = $stdin.gets.chomp.strip
    if answer == "yes" || answer == "Yes"
        takeItem(playerObj, roomObj, inspectedItem, true)
    end
  else
    puts "That's not a valid item."
  end

end

def useItem(playerObj, roomObj, unlockedRooms)

#we show and ask the player to type what item to use.
#if the item is anything but a key or a crowbar, it doesn't work.
  puts "What item do you want to use?"
  playerObj.inventory.each{|x| puts "> #{x}"}
  print "\n> "
  item = $stdin.gets.chomp.strip
  print "\n"
  #if the player is in the Corridor, game will ask which door to open, else
  # the key will or crowbar will open the only locked door.
  if playerObj.currentRoom.name == "Corridor"
    puts "On what door will you use the key?"
    roomObj.corridorDoors.keys.each{|x| puts "<> #{x}"}
    print "\n> "
    choice = $stdin.gets.chomp.strip
    if item == "Big key"
      if roomObj.corridorDoors.keys.any?(choice) && choice == "Main entrance"
         if playerObj.inventory.include?(item)
           puts "You open the main entrance door with the Big key"
           return "finished"
         end
      else
        puts "You cannot use the Big key in this door!"
      end
    elsif item == "Small key"
      if roomObj.corridorDoors.keys.any?(choice)
        #will return value of hash. "Bedroom door" returns "Bedroom"
        return roomObj.corridorDoors[choice]
      else
        puts "That's not an option!"
      end
    else item == "Crowbar"
      puts "On what door will you use the crowbar?"
      roomObj.corridorDoors.keys.each{|x| puts "<> #{x}"}
      choice = $stdin.gets.chomp.strip
      if roomObj.corridorDoors.keys.any?(choice)
         #will return value of hash. "Bedroom door" returns "Bedroom"
         return roomObj.corridorDoors[choice]
         roomObj.noiseLevel = "High"
      else
        puts "That's not an option!"
      end
    end

  else
    if item == "Small key"

      puts "On what door do you use the small key?"
      print "\n"
      roomObj.hasAccessTo.each{ |x| if !unlockedRooms.include?(x) ; puts "> #{x}";end}
      print "\n"
      choice = $stdin.gets.chomp.strip
      if roomObj.hasAccessTo.any?(choice)
        puts "Using #{item} on door to the #{choice}"
        sleep 1
        puts "You have unlocked the room's door with the small key"
        return choice
      else
        puts "That's not a room"
      end


    elsif item == "Crowbar"

      puts "Where do you use the crowbar?"
      roomObj.hasAccessTo.each{ |x| if !unlockedRooms.include?(x) ; puts "> #{x}";end}
      print "\n"
      choice = $stdin.gets.chomp.strip
      if roomObj.hasAccessTo.any?(choice)
        puts "Using #{item} on door to the #{choice}"
        sleep 1
        puts "You have unlocked the room's door with the crowbar"
        roomObj.noiseLevel = "High"
        return choice
      else
        puts "That's not a room"
      end

    elsif item == "Ornament key"
      if playerObj.currentRoom.name == "Basement"
        puts "Using Ornament key on Locker..."
        puts "You have found the Big Key!"
        playerObj.inventory.push("Big Key")
        playerObj.currentRoom.noiseLevel = "High"
      else
        puts "You can only use the Ornament key on its respective place."
      end
    elsif playerObj.inventory.include?(item)
      puts "This item cannot be used here."
    else
      puts "That's not a valid item."
    end
  end
end

def hide(playerObj, roomObj)

  #all rooms have hiding spots, we show them to the player and ask where to hide
  puts "Where do you hide?"
  puts roomObj.hidingSpots
  print "> "
  answer = $stdin.gets.chomp.strip
  sleep 1
  #if answer matches hiding spots, we set hidden status to true.
  if roomObj.hidingSpots.include?(answer)
    puts "You hide in #{answer}"
    playerObj.hidden = true
  else
    puts "That's not a place to hide!"
    playerObj.hidden = false
  end

  #puts "DEBUG: ", playerObj.hidden
end

def move(playerObj, roomObj)

  # if player is not on Corridor, player will always see one locked door if
  # any exist in the current room.
  if roomObj.name == "Corridor"
    #we get info from the roomObj to display in the screen
    #we also add a bit of text formatting and structure
    puts "-" * 50
    puts "You move to the: #{roomObj.name}"
    playerObj.currentRoom = roomObj
    puts "You are now in the #{roomObj.name}"
    puts "-" * 10
    sleep 1
    puts "You can see a few things to inspect:\n "
    sleep 1
    roomObj.roomItems.keys.each{|x| puts "<> #{x}"}
    puts "-" * 10
    sleep 1
    puts "You can see several locked doors.\n"
    roomObj.corridorDoors.keys.each{|key| puts "<> #{key}"}
    puts "-" * 10
    sleep 1
    puts "You can also see the following hiding spots:\n "
    roomObj.hidingSpots.each{|x| puts "<> #{x}" }
    puts "-" * 50
  elsif roomObj.name == "Basement"
    puts "-" * 50
    puts "You move to the: #{roomObj.name}"
    playerObj.currentRoom = roomObj
    puts "You are now in the #{roomObj.name}"
    puts "-" * 10
    sleep 1
    puts "You can see a few things to inspect:\n "
    sleep 1
    roomObj.roomItems.keys.each{|x| puts "<> #{x}"}
    puts "-" * 10
    sleep 1
    puts "You notice an ornament locker."
    if playerObj.currentRoom.lockedDoor == true
      puts "You notice a locked door."
    end
    sleep 1
    puts "-" * 10
    puts "You can also see the following hiding spots:\n "
    roomObj.hidingSpots.each{|x| puts "<> #{x}" }
    puts "-" * 50
  else
    puts "-" * 50
    puts "You move to the: #{roomObj.name}"
    playerObj.currentRoom = roomObj
    puts "You are now in the #{roomObj.name}"
    puts "-" * 10
    sleep 1
    puts "You can see a few things to inspect:\n "
    sleep 1
    roomObj.roomItems.keys.each{|x| puts "<> #{x}"}
    puts "-" * 10
    sleep 1
    if playerObj.currentRoom.lockedDoor == true
      puts "You notice a locked door."
    end
    sleep 1
    puts "-" * 10
    puts "You can also see the following hiding spots:\n "
    roomObj.hidingSpots.each{|x| puts "<> #{x}" }
    puts "-" * 50
  end
end

def randomRoom(roomsID, unlockedRooms, monsterObj)

  randomRoom = roomsID[rand(1..unlockedRooms.length)]

  if randomRoom == monsterObj.currentRoom
      randomRoom = randomRoom(roomsID, unlockedRooms ,monsterObj)
  end

  return randomRoom

end
