require_relative 'instruction'
class Lights
	@@MAX_SIZE = 1000
	attr_reader :grid
	def self.parse(line)
		#turn off 556,80 through 967,675
		if ( line =~ /(.+?)(\d+),(\d+) through (\d+),(\d+)/ )
			command = $1
			command.strip!
			start_corner = [$2.to_i,$3.to_i]
			end_corner = [$4.to_i,$5.to_i]
			instruction = Instruction.new(command, start_corner, end_corner)
		end
		instruction
	end
	def initialize()
		@grid = Array.new (@@MAX_SIZE) {Array.new(@@MAX_SIZE){0}}
	end
	def run_command(inst) 
		(inst.start_corner[0]..inst.end_corner[0]).each do |x|
			(inst.start_corner[1]..inst.end_corner[1]).each do |y|
				case inst.command 
				when "toggle"
					@grid[x][y] += 2
				when "turn on"
					@grid[x][y] += 1
				when "turn off"
					@grid[x][y] -= 1 if @grid[x][y] > 0
				end
			end
		end
	end
	def count_on
		sum = 0
		@grid.each do |row|
			row.each do |cell|
				sum += 1 if cell == true
			end
		end
		sum
	end
	def calculate_brightness
		sum = 0
		@grid.each do |row|
			row.each do |cell|
				sum += cell
			end
		end
		sum
	end
	def print_lights
		puts "Printing lights\n"
		@grid.each do |row|
			row.each do |cell|
				print cell ? "•" : " "
			end
			print "\n"
		end
	end
end