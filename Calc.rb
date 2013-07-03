puts "What's the first number?"
num1 = gets.chomp

puts "What's the second number?"
num2 = gets.chomp

puts "What would you like to do?"
puts "1) Add 2) Subtract 3) Multiply 4) Divide"
operation = gets.chomp

if operation == "1"
  result = num1.to_i + num2.to_i
  operation = "plus"
elsif operation == "2"
  result = num1.to_i - num2.to_i
  operation = "minus"
elsif operation == "3"
  result = num1.to_i * num2.to_i
  operation = "multiplied"
else
  result = num1.to_f / num2.to_f
  operation = "divided by"
end

puts "#{num1} #{operation} #{num2} = #{result}"





