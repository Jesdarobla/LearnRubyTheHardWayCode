def tenWays(arg1, arg2, arg3)
  puts "You have passed #{arg1} as an argument"
  puts "You have passed #{arg2} as an argument"
  puts "You have passed #{arg3} as an argument"
  puts "What a twist!"
end

tenWays(10, 50, 60)
puts "---------------------"
tenWays(var=10, var2=50, var3= 60)
puts "---------------------"
tenWays(50 + 50, 50 + 60, 0 + 100)
puts "---------------------"
tenWays(gets.chomp, gets.chomp, gets.chomp)
puts "---------------------"
tenWays("Monstrous!", "Pathetic!", "Death!") #5
puts "---------------------"
tenWays(10, 50, gets.chomp)
puts "---------------------"
tenWays(var=10+gets.chomp.to_i, var2=50+60, var3= 60)
puts "---------------------"
tenWays(50 + gets.chomp.to_i, 50 + 60, var="50".to_i)
puts "---------------------"

def heyThere
    return "Hey There!"
end

tenWays(60, gets.chomp, heyThere)
puts "---------------------"
tenWays("Monstrous!" + gets.chomp, "Pathetic!", "Death!" * 5) #10
