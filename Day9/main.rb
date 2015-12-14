require_relative 'distance'

lines = File.readlines("input.txt")
distance = Distance.new
lines.each do |line|
	distance.add_to_route(line)
end

answer = distance.longest_route()
puts "#{answer.distance.to_s} is the distance of the longest route.\n"
answer.places.each do |place|
	puts "#{ place }"
end