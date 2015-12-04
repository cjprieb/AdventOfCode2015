require_relative 'elevator'

file = File.open("input.txt", "r")
answer = Elevator.first_at(file.read, -1)
puts answer