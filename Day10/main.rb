require_relative 'sequence'
require 'benchmark'

Benchmark.bm do |x|
	input = "1113122113"
	count = 50
	result = ""
	x.report { result = Sequence.transform(input, count) }
	puts "\t#{result} is the length of #{input} transformed #{count} times.\n"
end

# Benchmark when keeping strings in the program
#       user     system      total        real
# 101.260000  41.130000 142.390000 (165.917107)
#	360154 is the length of 1113122113 transformed 40 times.

# Benchmark when storing strings in files
#       user     system      total        real
#   2.000000   0.040000   2.040000 (  2.420862)
#	360154 is the length of 1113122113 transformed 40 times.

# Benchmark when storing strings in files
#       user     system      total        real
#  28.280000   0.490000  28.770000 ( 36.478164)
#	5103798 is the length of 1113122113 transformed 50 times.