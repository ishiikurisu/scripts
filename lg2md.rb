#!/usr/bin/env ruby

# converts from listography format to markdown

if __FILE__ == $0
  while line = gets
    if line[0] == '*'
      alt = line[/\((.*)\)/]
      src = line[/\[(.*)\]/]
      if alt
        alt = alt[1...-1]
        src = src[1...-1]
        line = "- [#{alt}](#{src})"
      end
    end
    puts line
  end
end
