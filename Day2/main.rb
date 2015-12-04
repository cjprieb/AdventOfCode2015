require_relative 'wrapping'

file = File.readlines("input.txt")
answer = Wrapping.total_ribbon(file)
puts answer