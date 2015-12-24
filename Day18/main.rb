require_relative 'lights'
require 'benchmark'

Benchmark.bm do |x|
	input = File.readlines("input.txt")
	steps = 100
	result = ""
	x.report do
		lights = Lights.step_to_corners(input, steps)
		result = lights.lights_on_count
	end
	puts "\t#{result} lights are on after #{steps} steps.\n"
end

#TOO Low (new lines were being included)
#  user     system      total        real
#  5.650000   0.080000   5.730000 (  6.932469)
#	753 lights are on after 100 steps.

#       user     system      total        real
#  5.510000   0.130000   5.640000 ( 10.069044)
#	821 lights are on after 100 steps.

#TOO high
#       user     system      total        real
#  5.640000   0.100000   5.740000 (  6.058815)
#	928 lights are on after 100 steps.

#       user     system      total        real
#  5.730000   0.120000   5.850000 ( 11.694231)
#	886 lights are on after 100 steps.