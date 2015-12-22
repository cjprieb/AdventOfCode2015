class Sue
	attr_reader :id, :properties
	
	def initialize(input)
		if ( input =~ /Sue (\d+): (.*)/ )
			@id = $1.to_i
			@properties = {}
			$2.scan(/(\w+): (\d+)/) { |k,v| @properties[k] = v.to_i }
		else
			throw "Cannot create Sue details: #{input}"
		end
	end
	
	def match_count(gift_data)
		sum = 0
		@properties.each do |key,value|
			sum += 1 if ( gift_data[key] == value ) 
		end
		sum
	end
	
	def match_count_calibrated(gift_data)
		sum = 0
		@properties.each do |key,value|
			if ( key =~ /(cats|trees)/ )
				sum += 1 if ( gift_data[key] < value )
			elsif ( key =~ /(pomeranians|goldfish)/ )
				sum += 1 if ( gift_data[key] > value )
			else
				sum += 1 if ( gift_data[key] == value )
			end
		end
		sum
	end
	
	def self.parse(input)
		input.map { |line| Sue.new(line) }
	end
	
	def self.match(list_of_sues, gift_data)
		best_match = nil
		max_count = 0
		
		list_of_sues.each do |sue|
			cnt = sue.match_count_calibrated(gift_data)
			if ( cnt > max_count )
				max_count = cnt
				best_match = sue
			end
		end
		
		best_match
	end
end