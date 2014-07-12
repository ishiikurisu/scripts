# ip addr > ip.txt
file = open "ip.txt", "r"

lines = []
while line = file.gets
  lines << line
end

options = []
lines.each do |line|
  if line[/\d+\.\d+\.\d+.\d+\/\d+/]
    options << line[/\d+\.\d+\.\d+.\d+\/\d+/] 
  end
end

answer = 0
options.each do |line|
  option = line.split("/")
  answer = line if Integer(option[1]) > 20
end

puts answer
