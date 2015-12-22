require_relative 'sue'
require 'benchmark'

Benchmark.bm do |x|
	input = File.readlines("input.txt")
	result = ""
	x.report do
		list_of_sues = Sue.parse(input)
		gift_data = {
			"children" => 3,
			"cats" => 7,
			"samoyeds" => 2,
			"pomeranians" => 3,
			"akitas" => 0,
			"vizslas" => 0,
			"goldfish" => 5,
			"trees" => 3,
			"cars" => 2,
			"perfumes" => 1
		}
		result = Sue.match(list_of_sues, gift_data)
	end
	puts "\tThe Sue # #{result.id} gave you the gift.\n"
end
