#!/usr/bin/env ruby
require 'json'

unless ARGV.length == 1 || ARGV.length == 2
  print "Usage ./convertToJs.rb filename {'avg'}\n"
  exit
end

filename = ARGV[0]
make_avg = ARGV.length == 2

begin
  file = File.open filename
rescue Exception
  print "That isn't a real file, is it...\n"
  exit
end

# store all time to do every top level method
methodTimes = Hash.new {|h,k| h[k] = []}

# designed to only track the top level calls
stacksize = 0
stackcall = ""
startTime = 0
while begin line = file.readline rescue nil end
  split_line = line.split(' ')
  if split_line[0] == "start" && stacksize == 0
    stackcall = split_line[1]
    stacksize = 1
    startTime = split_line[2].to_f
  elsif split_line[0] == "start"
    stacksize += 1
  elsif stacksize == 1
    methodTimes[stackcall] << (split_line[2].to_f - startTime).round(6)
    stacksize = 0
  else
    stacksize -= 1
  end
end

if make_avg
  methodAvg = {}
  methodTimes.each do |call, times|
    methodAvg[call] = (times.reduce(:+) / times.size.to_f).round(6)
  end
  methodTimes = methodAvg
end
print methodTimes.to_json + "\n"
