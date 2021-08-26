# first input: dice size
# next inputs: how many dice
# type "x" to close
size = gets.chomp.to_i
line = gets.chomp
while line != "x"
  rolls = line.to_i
  results = []
  rolls.times do
    results << 1 + rand(size)
  end
  puts "#{results.join(' ')} (#{results.inject(:+)})"
  line = gets.chomp
end
