
=begin
The following code structure works with 3 objects, one from class Map, one from class Engine and one for each scene classes.

We create the Map object first with the name of the place we want to start in(central_corridor)
Afterwards, we create the Engine object and pass the Map object as a parameter.

The parameter @scene_map in the initialize from the Engine class is going to be the Map object we're going to call whenever we need to change scenario.
The parameter @current_scene will be an object of the different classes that are scenes, it will be changed using the @scene_map parameter.

You can write the word "cheat" in the door code guess to get the code automatically.

=end

def cheat(guess, code)
  if guess == "cheat"
    puts "The code is #{code}"
    return code
  else
    return guess
  end
end

class Scene
  def enter()
    puts "enter() from Scene class, this shouldn't be printed"
    exit(1)
  end
end

class Engine

  def initialize(scene_map)
    #@scene_map is a Map object.
    @scene_map = scene_map
  end



  def play()
    #@current_scene is an object, created from the Map object. In this case, it is an object from the CentralCorridor class.
    @current_scene = @scene_map.opening_scene()

    while @current_scene != false
      nexty = @current_scene.enter()
      if nexty == "finished"
        puts "Congratulations! You have won against the aliens and escaped in your escape pod!"
        break
      end
      #we set @current_scene to be a new object with the next scene, for that we call the Map object and call the next_scene function
      #with the @next parameter that contains the name of the next scenario.
      @current_scene = @scene_map.next_scene(nexty)


    end

  end

end

  class Death < Scene

    def enter()
      puts "You ended up dying. The aliens will now use your ship to infiltrate your planet and invade it."
      exit(1)
    end
  end

  class CentralCorridor < Scene

    def enter()
      puts "You're in the Central Corridor of the ship, here you face an alien that will kill you unless you act smart.\nWhat do you do?"
      print "> "
      action = $stdin.gets.chomp
      if action == "attack"
        puts "You attack the alien and disarm it, you hit it with your fist and the alien falls unconscious. Here you notice the Laser Weapon Armory entrance and go through it."
        return "laser_weapon_armory"
      elsif action == "dodge"
        puts "You try dodging but there's no attack to dodge, so you end up dead."
        return "death"
      else
        puts "DOES NOT COMPUTE"
        return "central_corridor"
      end
    end
  end

  class LaserWeaponArmory < Scene

    def enter()
      puts "In the Armory, you notice a door that leads to the self-destruct password needed to blow up the ship with the aliens.\n You must guess the door number."
      puts "You can only try this 10 times before the door locks forever."

      code = "#{rand(1..9)}#{rand(1..9)}#{rand(1..9)}"
      guess = $stdin.gets.chomp
      # puts "Code is: #{code}" #DEBUG
      tries = 0
      guess = cheat(guess, code)

      while code != guess && tries < 10
        tries += 1
        puts "Please, input the right code: "
        print "> "
        guess = $stdin.gets.chomp
      end
      if guess == code
        puts "You got the code right! The door opens and you get the password for the self-destruct sequence"
        return "the_bridge"
      else
        puts "The door locks forever, and you're unable to blow up the ship."
        return "death"
      end
    end
  end

  class TheBridge < Scene

    def enter()
      puts "In the bridge you find the Alien boss, and he's distracted redirecting the ship to you planet to invade it.\n What do you do?"; print "> "

      action = $stdin.gets.chomp
      if action == "attack"
        puts "You attack the Alien boss, but he notices you and defends. He offers you riches in exchange for helping with the invasion, but you decline and kill it with your gun."
        return "escape_pod"
      elsif action == "dodge"
        puts "There's is nothing to dodge, but you dodge anyway. The noise of your dodges alerts the Alien boss and it kills you."
        return "death"
      else
        puts "DOES NOT COMPUTE"
        return "the_bridge"
      end
    end
  end

  class EscapePod < Scene

    def enter()
      puts "In the bridge, you notice you can set the self-destruct mechanism off and escape in one of your escape pods."
      puts "After setting off the self-destruct sequence, you run to the escape pods."
      puts "You notice the second Alien Boss destroying your escape pods, what do you do?"
      print "> "
      action = $stdin.gets.chomp
      if action == "attack"
        puts "The second Alien Boss was too distracted to notice you, so you shoot right through it"
        return "finished"
      elsif action == "dodge"
        puts "There's nothing to dodge, but you do it anyway. The Alien Boss doesn't notice you, but he's done destroying your escape pods, so you end up dying in the explosion."
        return "death"
      else
        puts "DOES NOT COMPUTE"
        return "escape_pod"
      end
    end
  end


class Map

# we use @@scenes so the next_scene function has access to the other classes, otherwise it is considered a local variable.
  @@scenes = {
    "central_corridor" => CentralCorridor.new(),
    "the_bridge" => TheBridge.new(),
    "laser_weapon_armory" => LaserWeaponArmory.new(),
    "death" => Death.new(),
    "escape_pod" => EscapePod.new()
  }

  def initialize(start_scene)
    @start_scene = start_scene
  end

#this function will search in the hash for the scene that is passed to it. Once found, it will return the scene's class with the .new() function, so it creates a new object.
  def next_scene(scene_name)
    val = @@scenes[scene_name]
    return val #val here is returning a class of one of the scenes.
  end

  def opening_scene()
    #we call next_scene with the name of the scene we want to start with.
    return next_scene(@start_scene)

  end
end

  a_map = Map.new('central_corridor')
  a_game = Engine.new(a_map)
  a_game.play()
