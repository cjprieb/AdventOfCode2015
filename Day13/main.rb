require_relative 'table'
require 'benchmark'

Benchmark.bm do |x|
	input = File.readlines("input.txt")
	result = ""
	x.report do
		result = Table.arrange(input).totalHappiness
	end
	puts "\t#{result} is the total change in happiness for the optimal seating arrangement\n"
end

# Without me
#       user     system      total        real
#  15.920000   0.060000  15.980000 ( 16.196704)
#	709 is the total change in happiness for the optimal seating arrangement

# With me
#       user     system      total        real
#   4.600000   0.010000   4.610000 (  4.630408)
#	668 is the total change in happiness for the optimal seating arrangement