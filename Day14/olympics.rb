class Olympics
	
	class Reindeer
		attr_reader :distance, :name, :points
		attr_writer :points, :distance
	
		def initialize(input)
			@distance = @points = @timeFlown = @timeResting = 0
			@isResting = false
			if ( input =~ /(\w+) can fly (\d+) km\/s for (\d+) seconds, but then must rest for (\d+) seconds./ )
				@name = $1
				@velocity = $2.to_i
				@flyingLength = $3.to_i
				@restingLength = $4.to_i
			else
				throw "Unable to initialize reindeer with input: #{input}"
			end
		end
				
		def fly()
			if ( @isResting )
				@timeResting += 1
				if @timeResting == @restingLength
					@isResting = false
					@timeResting = 0 
				end
			else
				@timeFlown += 1
				@distance += @velocity
				if @timeFlown == @flyingLength			
					@isResting = true
					@timeFlown = 0					
				end
			end
			#cycle = @flyingLength + @restingLength
			#while seconds > cycle
			#	@distance += @velocity * @flyingLength
			#	seconds -= cycle
			#end
			#@distance += @velocity * (seconds > @flyingLength ? @flyingLength : seconds)
		end
	end
	
	def self.winner_after(input, seconds, system = nil)
		reindeer = []
		input.each do |line|
			reindeer.push(Reindeer.new(line))
		end
		
		maxDistance	= 0
		(1..seconds).each do			
			reindeer.each do |deer| 
				deer.fly
				if ( deer.distance > maxDistance )
					maxDistance = deer.distance
				end
			end
			reindeer.select { |deer| deer.distance == maxDistance }.each do |deer|
				deer.points += 1
			end
		end
		
		if ( system == "points" )
			return reindeer.max_by { |deer| deer.points }
		else
			return reindeer.max_by { |deer| deer.distance }
		end
	end
	
end
