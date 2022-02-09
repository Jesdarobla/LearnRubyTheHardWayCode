require "./ex45Methods.rb"
require "./ex45Classes.rb"

#Initializing all objects and needed variables.
player = Player.new()

monster = Monster.new()

kitchen = Kitchen.new()

corridor = Corridor.new()

garden = Garden.new()

bedroom = Bedroom.new()

livingRoom = LivingRoom.new()

bathroom = Bathroom.new()

garage = Garage.new()

attic = Attic.new()

basement = Basement.new()

pantry = Pantry.new()

#used for player move action so it doesn't show the object ID and shows a name.
#also used to show the current number of opened rooms.
unlockedRooms = {
  "Kitchen" => kitchen,
  "Corridor" => corridor,
  "Garden" => garden,

}
#Below is the list of locked rooms, these will only be accessible once the
# player has unlocked the respective door. Once unlocked the room will be
# deleted from this hash and added to the unlockedRooms hash.
lockedRooms = {
  "Bedroom" => bedroom,
  "Living Room" => livingRoom,
  "Pantry" => pantry,
  "Bathroom" => bathroom,
  "Garage" => garage,
  "Attic" => attic,
  "Basement" => basement,

}

#used for randomRoom, in order to randomly choose a room for the monster to
# move in.
roomsID = {
  1 => kitchen,
  2 => corridor,
  3 => garden,
}

#used to check if monster moves because of noise
monsterWait = 0
#used to check if monster is moving in current or next turn.
monsterNextRoom = 0

puts "-" * 50
puts "The game is simple. Escape through the main entrance using a Big key."
puts "Note: only usable items are crowbars, small keys, an Ornament key and a Big Key"
puts "You open doors by using small keys or crowbars."
puts "-" * 10
puts "You wake up in a Kitchen, but this isn't your house."
puts "You hear a distant growling inside the house, a monster lurks nearby."
puts "-" * 50
player.currentRoom = kitchen
monster.currentRoom = corridor

sleep 1
puts "Items in room: "
player.currentRoom.roomItems.keys.each{ |key| puts "<> #{key}"}

while true


  #if monster is in same room as player,
  if player.currentRoom == monster.currentRoom
    puts "The monster is now in the same room as you."
    puts "You better be hidden!"
    monsterWait = 0

    if player.hidden == true
      puts "The monster has not seen you hide. You're safe."
      player.hidden = false
      monster.monsterMove(monster, randomRoom(roomsID, unlockedRooms, monster))
    else
      dead()
    end
  end

  puts "-" * 50
  puts "\nWhat will you do?"
  sleep 1
  puts "\n<>Move\n<>Inspect\n<>Use item\n<>Hide\n<>Take item\n<>Throw item\n"
  print "\n> "

  #Action choice below
  answer = $stdin.gets.chomp.strip
  #system("clear")
  print "\n"
  case answer

  when "Move"
    puts "Where do you want to move?\n"
    print "\n"
    player.currentRoom.hasAccessTo.each do
     |x| if unlockedRooms.include?(x); puts "> #{x}"
         end
     end
     print "\n> "
    choice = $stdin.gets.chomp.strip
    print "\n"
    sleep 1
    if player.currentRoom.hasAccessTo.include?(choice) && unlockedRooms[choice]
        choiceIndex = player.currentRoom.hasAccessTo.index(choice)
        move(player, unlockedRooms[player.currentRoom.hasAccessTo[choiceIndex]])
    elsif lockedRooms[choice]
      puts "You have not unlocked that room yet."
    elsif choice == player.currentRoom.name
      puts "You're already in the #{choice}!"
    elsif unlockedRooms[choice] && !player.currentRoom.hasAccessTo.include?(choice)
      puts "You cannot access that room from here."
    else
      puts "That's not a room."
    end

  when "Inspect"
    puts "What do you want to inspect?\n "
    player.currentRoom.roomItems.keys.each{|x| puts "<> #{x}"}

    if player.currentRoom == corridor
      puts "\n<> Locked doors "
      puts "\n<> Main entrance"
    end
    if player.currentRoom.lockedDoor == true
      puts "\n<> Locked door"
    end
    print "\n> "
    choice = $stdin.gets.chomp.strip
    inspectItem(player, player.currentRoom, choice)

  when "Hide"
    hide(player, player.currentRoom)

  when "Take item"
    puts "What item do you want to take?"
    player.currentRoom.roomItems.keys.each do |key| puts "<>#{key}" end
    choice = $stdin.gets.chomp.strip
    print "\n> "

    if choice == player.currentRoom.roomItems[choice]
      takeItem(player, player.currentRoom, choice, true)
    else
      takeItem(player, player.currentRoom, choice, false)
    end

  when "Use item"
    #if the player currentRoom is in Corridor, this variable will have a value
    #otherwise is nil
    roomReturn = useItem(player, player.currentRoom, unlockedRooms)
    if roomReturn != nil && roomReturn == "finished"
      puts "You have escaped the house using the Big key"
      puts "You have won the g.ame! Congratulations!"
      exit(0)
    elsif roomReturn != nil
      if player.currentRoom == corridor
        #we insert in unlockedRooms the newly unlocked door.
        #roomReturn could be "Bedroom", therefore lockedRooms[roomReturn]
        # will be a bedroom object.
        unlockedRooms[roomReturn] = lockedRooms[roomReturn]
        lockedRooms.delete(roomReturn)
        player.currentRoom.corridorDoors.delete_if{|key, value| value == roomReturn}
        puts "The door to #{roomReturn} is now open."
        #we add the new room with its respective ID to the roomsID hash
      else
        unlockedRooms[roomReturn] = lockedRooms[roomReturn]
        lockedRooms.delete(roomReturn)
        player.currentRoom.lockedDoor = false
      end
      roomsID[unlockedRooms.length] = unlockedRooms[roomReturn]
    end

  when "Throw item"

    puts "What are you throwing?"
    player.inventory.each{ |x| puts "<>#{x}"}
    choice = $stdin.gets.chomp.strip
    roomThrow = throwItem(player, choice, unlockedRooms)
    #comment below will be expanded in the future for monster luring throwing items
    #unlockedRooms[roomThrow].noiseLevel = "High"

  else
    puts "That's not an option!\n"
end



  #After action choice is done, we initiate monster sequence.
  print "\n"
  #if monster has noticed noise, it will move.
  if monsterWait == 1 #this will only be 1 if the next if-statement is true.
    monster.monsterMove(monster, player.currentRoom)
  end

  # If the actions of player made a lot of noise, the monster will notice.
  if player.currentRoom.noiseLevel == "High"
    monsterWait = 1
    puts "You have made enough noise for the monster to notice you!"
    puts "The monster will move to the same room as you"
    #room noise is reset
    player.currentRoom.noiseLevel = "Low"
  elsif player.currentRoom.noiseLevel == "Low" && player.currentRoom != monster.currentRoom
    puts "The monster hasn't noticed the noise."
  end

  #below the code that makes the monster move randomly when noise is low
  #the monster can move to ANY room at any point, without restrictions
  if monsterWait == 0 && monsterNextRoom == 0
    nextRoom = randomRoom(roomsID, unlockedRooms, monster)
    puts "The monster is moving rooms. Looks like it is heading to #{nextRoom.name}"
    if nextRoom == player.currentRoom
      puts "The monster is getting closer to your room. Have care!"
    end
    monsterNextRoom = 1
  elsif monsterWait == 0 && monsterNextRoom == 1
    monster.monsterMove(monster, nextRoom)
    monsterNextRoom = 0
  elsif monsterWait == 1 && monsterNextRoom == 1
    monsterNextRoom = 0
  end



end
