require_relative 'eggnog'
require 'benchmark'

Benchmark.bm do |x|
	input = File.readlines("input.txt")
	result = ""
	x.report do
		list_of_containers = Eggnog.parse(input)
		result = Eggnog.min_containers(list_of_containers, 150)
	end
	puts "\t#{result.combinations} combinations of #{result.containers_count} containers are possible for 150 liters of eggnog.\n"
end
