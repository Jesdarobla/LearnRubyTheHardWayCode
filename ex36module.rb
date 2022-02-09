module Ex36

#Starting functions start and dead
  def Ex36.start

    puts "You're in a random city, where do you go?"
    puts "Mall."
    puts "Parking Lot."
    puts "Series of battles."
    print "> "
    answer = $stdin.gets.chomp

    if answer == "Mall"
      Ex36.mall()
    elsif answer == "Parking Lot"
      Ex36.parking_lot()
    elsif answer == "Series of battles"
      Ex36.battles()
    else
      Ex36.dead("Learn to type the right answer.")
    end
  end

  def Ex36.dead(why)
    puts why , "Good job."
    exit(0)
  end


#-----------------------------------------------------------------------------------


#All functions until the next block are linked to the Mall path

  def Ex36.mall

    puts "You're in a Shopping Mall. Where do you go?"
    puts "Samurai School"
    puts "Ninja School"
    puts "Strange room with doors"
    print "> "

    answer = $stdin.gets.chomp

    if answer == "Samurai School"
      Ex36.samurai()
    elsif answer == "Ninja School"
      ninja()
    elsif answer == "Strange room with doors" || 3
      rooms()
    else
      Ex36.dead("Learn to type the right answer")
    end

  end

  def Ex36.rooms
    for i in (0..3)
      puts "You find yourself trapped in a room with 5 doors.\nWhat door do you choose?"
      puts "1, 2, 3, 4, or 5?"
      print "> "

      answer = $stdin.gets.chomp

      if answer == "4"
        break
      else
        puts "That door leads back to the same room!"
      end

      if i == 3
        dead("The room eats you alive after trying all wrong doors.")
      end

    end

    puts "You managed to escape the room!"
    exit(0)
  end

  def Ex36.samurai
    puts "You become one of the best Samurai the world has seen, what do you do now? Kill your master or go to Somalia to learn the ultimate technique?"
    puts "Kill master"
    puts "Somalia"
    print "> "

    answer = $stdin.gets.chomp

    if answer == "Kill master"
      puts "You try killing your master in cold blood but he notices before you can hit them."
      puts "Your master begs you to stop, be stronger than your dark side."
      puts "Kill"
      puts "Stop"
      print "> "

      ending = $stdin.gets.chomp

      if ending == "Kill"
        puts "Your bravado made you think you could take on your master, but he kills you easily."
        dead ("Your master killed you.")
      elsif ending == "Stop"
        puts "You stopped your dark side before it could consume you, your master is proud"
        dead ("You have become a great Samurai.")
      else
        dead("learn to type")
      end

    elsif answer == "Somalia"
        dead("There are no Samurai in Somalia, fool.")
    else
      dead("Lol dude")
    end
  end

  def Ex36.ninja
    puts "You become one of the best ninjas in the world."
    puts "You can try killing your master, or you can kill the other students and flee, in order to become the villain of someone's adventure."
    puts "Kill master"
    puts "Kill students"
    print "> "
    answer = $stdin.gets.chomp

    if answer == "Kill master"
      dead("Master teleports behind you and kills you.\"Nothing Personel Kid\"")
    elsif answer == "Kill students"
      villain()
    else
      dead("Bad answer")
    end
  end

  def Ex36.villain

    puts "You kill the other students, but not your master."
    puts "You become the villain of someone else's story"
    puts "You know have to choose: Let your master find you and fight them, or hide and learn the Dark Ninja Arts"
    puts "Kill master"
    puts "Dark arts"
    print "> "

    answer = $stdin.gets.chomp

    if answer == "Kill master"
      dead("You thought you could take your master, but he still teleports behind you and kills you.")
    elsif answer == "Dark arts"
      dark_arts()
    else
      dead("Learn to type the answer")
    end

  end

  def Ex36.dark_arts

    puts "You find the Dark Ninja Master, who teaches you the dark side of the ninja arts."
    puts "You need to choose between killing your master or leaving and thanking them."
    puts "Kill master"
    puts "Thank master"
    print "> "

    answer = $stdin.gets.chomp

    if answer == "Kill master"
      dark_end()
    elsif answer == "Thank master"
      dead("You thank your master and leave but he kills your soul and takes your body. Your master betrayed you and now them have become the strongest.")
    else
      dead("Learn to type the answer")
    end

  end

  def Ex36.dark_end

    puts "You kill the Dark Ninja Master by teleporting behind him."
    puts "You are now the strongers Dark Ninja known."
    puts "You stop and think of your next action, and two paths come to mind."
    puts "Fight the your previous Ninja Master and kill them using your new found powers."
    puts "or ask them for forgiveness, for you have been led astray from the path of good"
    puts "Kill previous master"
    puts "Forgive"
    print "> "

    ending = $stdin.gets.chomp

    if ending == "Kill previous master"
      puts "You kill your previous master with the new dark powers you obtained, you are now free from any past ties to do your own thing"
      exit(0)
    elsif ending == "Forgive"
      puts "Your master understands you, but does not forgive you, for you killed all them students. However he helps you come back to the right path, and use your new powers for good."
      exit(0)
    else
      dead("Learn to type")
    end

  end

#-----------------------------------------------------------------------------------


#All functions until the next block are linked to the Parking Lot path

  def Ex36.parking_lot

    puts "You go to the parking lot"
    puts "There's a dark room, and a car with the door open and the keys inside. \n Where do you go?"
    puts "Dark Room"
    puts "Steal Car"
    print "> "

    answer = $stdin.gets.chomp

    if answer == "Dark Room"
      dead("You go into the dark room, and get killed by a murderer on the lose that was hiding there.")
    elsif answer == "Steal Car"
      steal_car()
    else
      dead("Type the right answer, dumbass")
    end
  end

  def Ex36.steal_car

    puts """You steal the car, but the police notice and start chasing you. \nYou can either escape the city, try to lose the cops or surrender to the cops.
      Escape the city.
      Surrender to cops.
      """
    print "> "

    answer = $stdin.gets.chomp

    if answer == "Escape the city"
      city_escape()
    elsif answer == "Surrender to cops"
      surrender()
    else
      dead("Bad answer typing")
    end
  end

  def Ex36.surrender

    puts """ You surrender to the police, yet you are faced with a choice.\nEither comply with the police, or shoot police in a surprise attack.
    Comply.
    Shoot.
    """
    print "> "

    answer = $stdin.gets.chomp

    if answer == "Comply"
      puts """You end up in court and can either say god made you steal the car LONG LIVE MURICA, or admit your mistake and go to jail.
      God.
      Guilty.
      """
      ending = $stdin.gets.chomp
      if ending == "God"
        puts "You are made a police officer, long live MURICA."
        exit(0)
      elsif answer == "Guilty"
        puts "You are sent to jail, you may have been honest, but now you in jail."
        exit(0)
      else
        dead("Since you can't type, you die.")
      end
    elsif answer == "Shoot"
      dead("You try shooting at the police, but you are shot to death before you can shoot anyone")
    else
    end


  end

  def Ex36.city_escape

    puts """You have escaped the city with the car.\n You now have to choose between 2 different new cities to settle in.
    Chile.
    Brazil.
    """
    print "> "

    answer = $stdin.gets.chomp

    if answer == "Chile"
      puts "You live a nice life and become WATÓN"
    elsif answer == "Brazil"
      puts "Bro that's Brazil, you get lost in the Amazon."
    else
      dead("You suck at typing")
    end

  end

#-----------------------------------------------------------------------------------


#All functions until the next block are linked to the Battle series path

#Battle flow funtion, calls monster functions.
  def Ex36.battles

    health = 100
    puts "--------------------------------"
    puts "\nWelcome to the battle series, your first opponent is a slime.\nYour starting HP is #{health}"
    health = slime(health)
    puts "\nYour HP for the next fight is #{health}"
    puts "--------------------------------"
    puts "Your next opponent is a Goblin"
    health = goblin(health)
    puts "\nYour HP for the next fight is #{health}"
    puts "--------------------------------"
    puts "Your final opponent is a mighty Minotaur!"
    minotaur(health)
    puts "--------------------------------"
    puts "You have won the battle series!"
    exit(0)
  end

  def Ex36.damage_dealt # a random damage number from 1 to 10
    pick = rand(10)
    if pick == 0
      pick+=1
    end
    return pick
  end

  def Ex36.slime(hp)

#Initializing parameters
    slimeHP = 10
    selfHP = hp

#Combat loop, as long as enemy has more than 0 HP, the loop will continue.
    while slimeHP > 0
      puts "--------------------------------"
      puts "\nThe slime has #{slimeHP} HP"
      puts "What do you do? \nPunch\nKick\nDefend"
      print "> "
      defend = false
      answer = $stdin.gets.chomp
      print "\n"
      if answer.include?("Punch")
        puts "You punch the slime"
        slimeHP-=5
        puts "Slime receives 5 damage"
      elsif answer.include?("Kick")
        puts "You kick the slime"
        slimeHP-=6
        puts "Slime receives 6 damage"
      elsif answer.include?("Defend")
        puts "You defend yourself, damage is reduced by 1"
        defend = true
      else
        puts "Wrong option, you lose a turn."
      end

      if slimeHP < 0
        slimeHP = 0
      end

      puts "The Slime HP is #{slimeHP} "

      damage_ingame = damage_dealt()
      if slimeHP == 0
        puts "The slime is dead!"
      elsif defend == false
          selfHP-=damage_ingame
          puts "The slime hits you for #{damage_ingame} HP, your health is now: #{selfHP}"
      else
          selfHP = selfHP - (damage_ingame / 2)
          puts "The slime hits you for #{damage_ingame / 2} HP, your health is now: #{selfHP}"
      end

      if selfHP <= 0
        dead("Slime killed you.")
      end



    end

    return selfHP

  end

  def Ex36.goblin(hp)

#Initializing parameters
    goblinHP = 10
    selfHP = hp

#Combat loop, as long as enemy has more than 0 HP, the loop will continue.
    while goblinHP > 0
      puts "--------------------------------"
      puts "\nThe Goblin has #{goblinHP} HP"
      puts "What do you do? \nPunch\nKick\nDefend"
      print "> "
      defend = false
      answer = $stdin.gets.chomp
      print "\n"
      if answer.include?("Punch")
        puts "You punch the Goblin"
        goblinHP-=5
        puts "Goblin receives 5 damage"
      elsif answer.include?("Kick")
        puts "You kick the slime"
        goblinHP-=6
        puts "Goblin receives 6 damage"
      elsif answer.include?("Defend")
        puts "You defend yourself, damage is reduced by 2"
        defend = true
      else
        puts "Wrong option, you lose a turn."
      end

      if goblinHP < 0
        goblinHP = 0
      end

      puts "The Goblin HP is #{goblinHP} "

      damage_ingame = damage_dealt()
      if goblinHP == 0
        puts "The Goblin is dead!"
      elsif defend == false
          selfHP-=damage_ingame
          puts "The Goblin hits you for #{damage_ingame} HP, your health is now: #{selfHP}"
      else
          selfHP = selfHP - (damage_ingame / 2)
          puts "The Goblin hits you for #{damage_ingame / 2} HP, your health is now: #{selfHP}"
      end

      if selfHP <= 0
        dead("Goblin killed you.")
      end



    end

    return selfHP

  end

  def Ex36.minotaur(hp)

#Initializing parameters
    minotaurHP = 10
    selfHP = hp

#Combat loop, as long as enemy has more than 0 HP, the loop will continue.
    while minotaurHP > 0
      puts "--------------------------------"
      puts "\nThe Minotaur has #{minotaurHP} HP"
      puts "What do you do? \nPunch\nKick\nDefend"
      print "> "
      defend = false
      answer = $stdin.gets.chomp
      print "\n"
      if answer.include?("Punch")
        puts "You punch the Minotaur"
        minotaurHP-=5
        puts "Minotaur receives 5 damage"
      elsif answer.include?("Kick")
        puts "You kick the Minotaur"
        minotaurHP-=6
        puts "Minotaur receives 6 damage"
      elsif answer.include?("Defend")
        puts "You defend yourself, damage is reduced by 5"
        defend = true
      else
        puts "Wrong option, you lose a turn."
      end

      if minotaurHP < 0
        minotaurHP = 0
      end

      puts "The Minotaur HP is #{minotaurHP} "

      damage_ingame = damage_dealt()
      if minotaurHP == 0
        puts "The Minotaur is dead!"
      elsif defend == false
          selfHP-=damage_ingame
          puts "The Minotaur hits you for #{damage_ingame} HP, your health is now: #{selfHP}"
      else
          selfHP = selfHP - (damage_ingame / 2)

          puts "The Minotaur hits you for #{damage_ingame / 2} HP, your health is now: #{selfHP}"
      end

      if selfHP <= 0
        dead("Minotaur killed you.")
      end



    end

    return selfHP

  end

end
