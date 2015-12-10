class Circuit		
	def self.parse(line)
		tokens = line.split(" ")
		arrowFound = false
		wires = []		
		intValue = mode = name = nil
		tokens.each do |token|
			if ( token =~ /[[:upper:]]/ ) then
				mode = token.downcase
			elsif arrowFound then
				name = token
			elsif token == "->" then
				arrowFound = true
			else
				wires.push(token)	
			end
		end
		Wire.new(line, name, mode, wires)
	end
	
	class Wire
		@@MAX_INTEGER = 65536
		attr_reader :wires, :mode, :name
		def initialize(line, name, mode, wires)
			@line = line 
			@name = name
			@mode = mode
			@wires = wires
			@value = nil
		end
		def calculate(depth, circuit_hash)
			begin
				#puts "Calculating value for wire #{ @name }"
				if ( @value == nil )
					inputValues = []
					@wires.each do |wireName|
						wire = circuit_hash[wireName]
						if ( wire != nil ) 
							x = wire.calculate(depth+1,circuit_hash)
							#puts "\tpushing calculation: #{ x }"
						else 
							x = wireName.to_i
							#puts "\tpushing integer: #{ x }"
						end		
						inputValues.push(x)
						if ( x < 0 )
							@value = -1
							break
						end
					end					
					case @mode
					when "and"
						#two inputs
						@value = inputValues.length == 2 ? inputValues[0] & inputValues[1] : -1
					when "or"
						#two inputs
						@value = inputValues.length == 2 ? inputValues[0] | inputValues[1] : -1
					when "lshift"
						#left shift; only one input
						@value = inputValues.length == 2 ? inputValues[0] << inputValues[1] : -1
					when "rshift"
						#right shift; only one input
						@value = inputValues.length == 2 ? inputValues[0] >> inputValues[1] : -1
					when "not"	
						#bitwise complement; only one input
						@value = inputValues.length == 1 ? @@MAX_INTEGER + ~inputValues[0] : -1
					when nil
						@value = inputValues[0]
					end
				end
			rescue StandardError => bang
				puts "Something broke: at #{ @line }" + bang.to_s
				@value = -1
			end
			f = File::open("output.txt", mode="a")
			f.write(" "*depth + "Value for wire #{ @name } is #{ @value }\n")
			f.close
			@value
		end
	end
	
	def initialize
		@circuit_hash = {}
	end
	
	def addToCircuit(wire)
		if ( @circuit_hash[wire.name] != nil )
			puts "ERROR! name already exists: " + wire.name
		end
		@circuit_hash[wire.name] = wire
	end
	
	def signalAt(wireName)
		f = File::open("output.txt", mode="w")
		f.write("")
		f.close
		wire = @circuit_hash[wireName]
		wire.calculate(0, @circuit_hash)
	end
end