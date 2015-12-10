require_relative 'niceness'

file = File.open("input.txt")
input = file.readlines

answer = Niceness.count_nice_strings(input)
puts "There are #{ answer } nice strings."