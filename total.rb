#! /usr/bin/env ruby

require 'time'

log = File.open("log.txt")

totals = log.reduce({}) do |totals, line|
  log_entry = line.split(" ")

  date = Time.parse(log_entry.first)

  minutes = log_entry.last.gsub("m", "").to_i

  totals["All time"] ||= { total: 0 }
  totals[date.year.to_s] ||= { total: 0 }
  totals[date.year.to_s][date.month.to_s] ||= 0

  totals["All time"][:total] += minutes
  totals[date.year.to_s][:total] += minutes
  totals[date.year.to_s][date.month.to_s] += minutes

  totals
end

totals.keys.each do |key|
  totals[key].keys.each do |sub_key|
    total = totals[key][sub_key]
    hours = total / 60
    minutes = total - (hours * 60)
    puts "#{key.to_s.ljust(10)} #{((sub_key.to_s) ++ ":").ljust(10)} #{hours}h #{minutes}m"
  end
end
