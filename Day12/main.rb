require_relative 'budget'
require 'benchmark'

Benchmark.bm do |x|
	input = File.read("input.txt")
	result = ""
	x.report do
		result = Budget.sum(input) 
	end
	puts "\t#{result} is the sum of the numbers in that strange file. (After adjustment)\n"
#	puts "ruby: sum of file: #{result}\n"
end

#       user     system      total        real
#   0.000000   0.000000   0.000000 (  0.002615)
#	119433 is the sum of the numbers in that strange file.

# BAD CALCULATION
#       user     system      total        real
#   0.010000   0.000000   0.010000 (  0.015362)
#	62515 is the sum of the numbers in that strange file. (After adjustment)

# BAD CALCULATION 2
#      user     system      total        real
#  0.000000   0.000000   0.000000 (  0.004473)
#	27022 is the sum of the numbers in that strange file. (After adjustment)

#       user     system      total        real
#   0.020000   0.000000   0.020000 (  0.020905)
#	68466 is the sum of the numbers in that strange file. (After adjustment)
