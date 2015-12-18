require_relative 'password'
require 'benchmark'

Benchmark.bm do |x|
	input = "cqjxxyzz" #"cqjxjnds"
	result = ""
	x.report { result = Password.next(input) }
	puts "\t#{result} is the next password after #{input}.\n"
end


#       user     system      total        real
#   1.820000   0.010000   1.830000 (  2.043698)
#	cqjxxyzz is the next password after cqjxxyzz.

#       user     system      total        real
#   6.830000   0.050000   6.880000 (  7.434938)
#	cqkaabcc is the next password after cqjxxyzz.