require_relative 'olympics'
require 'benchmark'

Benchmark.bm do |x|
	input = File.readlines("input.txt")
	result = ""
	seconds = 2503
	x.report do
		result = Olympics.winner_after(input, seconds, "points")
	end
	puts "\tAfter #{seconds} seconds, #{result.name} is in the lead with #{result.points} points\n"
end

#	After 2503 seconds, Vixen is in the lead with a distance of 2660

#       user     system      total        real
#   0.010000   0.000000   0.010000 (  0.015484)
#	After 2503 seconds, Blitzen is in the lead with 1256 points