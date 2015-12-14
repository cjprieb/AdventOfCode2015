require_relative 'matchsticks'

lines = File.readlines("input.txt")
answer = Matchsticks.total_encode_count(lines)
puts "#{answer} lines are escaped.\n"