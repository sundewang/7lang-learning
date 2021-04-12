# 2.2.7节习题
# 让玩家猜随机数大小
random = rand(10)
input = gets.to_i
if input > random
  puts "Greater"
else 
  if input == random
    puts "Equal"
  else
    puts "Smaller"
  end
end
