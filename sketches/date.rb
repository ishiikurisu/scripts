date_file = "date.txt"
system "date > #{date_file}"

fp = open date_file, "r"
string = fp.read
words = string.split
time = nil
words.each do |word|
  time = word if word[/\d+:\d+:\d+/]
end
time = time.split(":")
time[0] = String(Integer(time[0]) + 3)
if Integer(time[0]) < 10
  time[0] = time[0].concat("0").reverse
elsif Integer(time[0]) > 24
  time[0] = String(Integer(time[0]) - 24)
end
new_hour = ""
time.each do |hour|
  new_hour.concat(hour)
  new_hour.concat(":")
end
new_hour.chomp!(":")
new_date = ""
words.each do |word|
  if word[/\d+:\d+:\d+/]
    new_date.concat(new_hour)
  else
    new_date.concat(word)
  end
  new_date.concat(" ")
end
new_date.chomp!

# puts new_date
system "sudo date --set=\"#{new_date}\""
system "rm #{date_file}"