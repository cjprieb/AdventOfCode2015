class Lights
	def self.step_to(input, step)
		throw "Input cannot be null" if ( input == nil ) 
		lights = Lights.new(input, false) #corners_on = false
		(1..step).each do
			lights.step 
		end
		lights
	end
	
	def self.step_to_corners(input, step)
		throw "Input cannot be null" if ( input == nil ) 
		lights = Lights.new(input, true) #corners_on = true
		(1..step).each do
			lights.step 
		end
		lights
	end
	
	attr_reader :step_count
	
	def initialize(input, corners_on)
		@lights = input.map do |row|
			row.strip.split("")
		end
		@corners_always_on = corners_on
		if ( @corners_always_on )
			@lights[0][0] = "#"
			@lights[0][@lights[0].length-1] = "#"
			@lights[@lights.length-1][0] = "#"
			@lights[@lights.length-1][@lights[0].length-1] = "#"
		end
		@step_count = 0
	end
	
	def step
		@step_count += 1
		if (@step_count % 10 == 0)
			puts "Running step #{@step_count}"
		end
		temp = @lights.map do |row|
			row.clone
		end
		@lights.each_with_index do |row, y|
			row.each_with_index do |cell, x|
				next if is_always_on?(x, y, row.length)
				
				is_on = cell == "#"
				#count includes middle cell
				cnt = count_surrounding_lights(x, y, row.length)
				#puts "cnt for (#{x}, #{y}) is #{cnt}"
				if ( is_on && (cnt != 2 && cnt != 3) )
					#puts "  turning off"
					temp[y][x] = "."
				elsif ( !is_on && cnt == 3 )
					#puts "  turning on" 
					temp[y][x] = "#"
				end
			end
		end
		@lights = temp
	end
	
	def is_always_on?(x, y, row_length)
		if ( @corners_always_on )
			return ((x == 0 || x == row_length-1) &&
			(y == 0 || y == @lights.length-1))
		end
		return false
	end
	
	def count_surrounding_lights(x, y, row_length)
		sum = 0
		min_x = x-1 < 0 ? x : x-1
		max_x = x+1 >= row_length ? x : x+1
		min_y = y-1 < 0 ? 0 : y-1
		max_y = y+1 >= @lights.length ? y : y+1
		#if ( y == 0 )
		#	puts "(#{x}, #{y})"
		#	puts "    x's: #{min_x} to #{max_x}"
		#	puts "    y's: #{min_y} to #{max_y}" 
		#end
		(min_x..max_x).each do |i|
			(min_y..max_y).each do |j|
				#if ( y == 0 )
				#	puts "    (#{j}, #{i}) == #{@lights[j][i]}"
				#end
				if ( (j != y || i != x) && @lights[j][i] == "#" ) 
					sum += 1
				end
			end
		end
		sum
	end
	
	def lights
		@lights.map do |row|
			row.inject { |s, cell| s + cell }
		end
	end
	
	def lights_on_count
		sum = 0
		@lights.each do |row|
			sum += row.select { |cell| cell == "#" }.length
		end
		sum 
	end
end