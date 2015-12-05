# Santa is delivering presents to an infinite two-dimensional grid of houses.
#
# He begins by delivering a present to the house at his starting location, and 
# then an elf at the North Pole calls him via radio and tells him where to move 
# next. Moves are always exactly one house to the north (^), south (v), east (>),
# or west (<). After each move, he delivers another present to the house at his 
# new location.
#
# However, the elf back at the north pole has had a little too much eggnog, and 
# so his directions are a little off, and Santa ends up visiting some houses 
# more than once. How many houses receive at least one present?
class World
	def self.deliver(directions)
		locations = Hash.new(0)
		x = 0
		y = 0
		locations[x.to_s + "," + y.to_s] += 1
		directions.split("").each do |dir|
			case dir
			when "<" 
				x -= 1
			when ">"
				x += 1				
			when "^" 
				y += 1
			when "v" 
				y -= 1
			end
			locations[x.to_s + "," + y.to_s] += 1
		end
		locations.length
	end
	
	def self.deliver_with_robot(directions)
		locations = Hash.new(0)
		x = [0,0]
		y = [0,0]
		santa = 0
		locations[x[santa].to_s + "," + y[santa].to_s] += 1
		directions.split("").each do |dir|
			case dir
			when "<" 
				x[santa] -= 1
			when ">"
				x[santa] += 1				
			when "^" 
				y[santa] += 1
			when "v" 
				y[santa] -= 1
			end
			locations[x[santa].to_s + "," + y[santa].to_s] += 1
			santa = (santa + 1) % 2
		end
		locations.length
	end
end