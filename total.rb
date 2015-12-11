#! /usr/bin/env ruby

log = File.open("log.txt")

total = log.inject(0) do |sum, line|
  sum += line.split(" ").last.gsub("m", "").to_i
end

hours = total / 60
minutes = total - (hours * 60)

puts "Total meditation time: #{hours}h #{minutes}m"
