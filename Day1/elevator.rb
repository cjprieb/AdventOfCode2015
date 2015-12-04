#file = File.open("input");
	
class Elevator
# An opening parenthesis, (, means he should go up one floor, 
# and a closing parenthesis, ), means he should go down one floor.
	def self.move(instructions)
		currFloor = 0
		instructions.split("").each do |dir|
			if dir == '(' then
				currFloor += 1
			else 
				currFloor -= 1
			end
		end 
		currFloor
	end
	
	def self.first_at(instructions, floor)
		currFloor = 0
		position = 0
		instructions.split("").each do |dir|
			position += 1
			if dir == '(' then
				currFloor += 1
			else 
				currFloor -= 1
			end
			if currFloor == -1 then break end
		end 
		position		 
	end
end