require_relative 'recipe'
require 'benchmark'

Benchmark.bm do |x|
	input = File.readlines("input.txt")
	result = ""
	x.report do
		recipe = Recipe.new()
		result = recipe.best_cookie(input, 100)
	end
	puts "\tThe best cookie has a score of #{result}\n"
end

# Too High
#       user     system      total        real
#   1.940000   0.010000   1.950000 (  1.988710)
#	The best cookie has a score of 10618782720