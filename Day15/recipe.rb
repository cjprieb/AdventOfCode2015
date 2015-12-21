class Recipe
	
	class Ingredient 
		attr_reader :name, :properties
	
		def initialize(input)
			@properties = {}
			if ( input =~ /(\w+): (.+)/ )
				@name = $1
				$2.scan(/(\w+) (-?\d+)(?:,|$)/) do |prop, value|
					@properties[prop] = value.to_i
				end
			else
				throw "Unable to initialize ingredient with input: #{input}"
			end
		end
	end	
	
	def best_cookie(input, teaspoons)
		@properties = {}
		@ingredient_length = 0
		input.each do |line|
			ingredient = Ingredient.new(line)
			ingredient.properties.each do |prop, value|
				if ( @properties[prop] == nil ) 
					@properties[prop] = [value]
				else
					@properties[prop].push(value)
				end 
			end
			@ingredient_length += 1
		end	
		max_score(0, 1, 100, Hash.new(0))
	end
	
	def max_score(start_index, min_tsp, tsp, total_score_map)
		max = 0
		#tabs = "\t" * start_index
		#max_tsp = tsp > 60 ? 60 : tsp
		#puts tabs + "#{min_tsp} to #{tsp}"
		#puts tabs + "Total: #{total_score_map}"
		(min_tsp..tsp).each do |amount|	
			curr_score_map = get_score_map(start_index, amount, total_score_map)
			#puts tabs + "Calulating score for #{amount}"
			#puts tabs + "Curr: #{curr_score_map}"
			
			score = 0
			next_index = start_index+1
			next_tsp = tsp-amount
			if ( next_index+1 < @ingredient_length )
				score = max_score(next_index, min_tsp, next_tsp, curr_score_map)
			elsif ( next_index < @ingredient_length )
				score = max_score(next_index, next_tsp, next_tsp, curr_score_map)
			else
				#puts tabs + "Calulating score for #{amount}\n\t#{curr_score_map}"
				score = curr_score_map.values.inject(1) do |product, value|
					product * (value < 0 ? 0 : value)
				end
			end
			
			if score > max
				max = score
				#puts tabs + "Max score for #{start_index} is #{score} with #{amount} tsp"
			end
		end
		max
	end
	
	def get_score_map(start_index, amount, total_score_map)
		score_map = {}
		@properties.each do |key,value|
			#puts "Scores for #{start_index} is #{value[start_index]} * #{amount} + #{total_score_map[key]}"
			score_map[key] = value[start_index] * amount + total_score_map[key]
		end
		score_map
	end
end
