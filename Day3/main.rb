require_relative 'world'

file = File.open("input.txt")
input = file.read

answer = World.deliver(input)
puts "Santa will delivery to #{ answer } houses."

answer = World.deliver_with_robot(input)
puts "Santa and Robo-Santa will delivery to #{ answer } houses."