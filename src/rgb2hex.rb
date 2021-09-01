#!/usr/bin/ruby
puts "\##{ARGV.map{|x| '%x' % x.to_i}.join}"
