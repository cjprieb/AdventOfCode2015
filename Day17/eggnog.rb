Result = Struct.new(:containers_count, :combinations) do 
end

class Eggnog
	
	def self.parse(input)
		input.map { |line| line.to_i }
	end
	
	def self.valid_combinations(list_of_containers, liters_to_contain)
		return combinations(list_of_containers, liters_to_contain).combinations
	end
	
	def self.min_containers(list_of_containers, liters_to_contain)
		result = combinations(list_of_containers, liters_to_contain, {})
		Result.new()
	end
	
	
	def self.combinations(list_of_containers, liters_to_contain, result)
		combination_count = 0
		len = list_of_containers.length
		#tabs = "\t" * (5-len)
		list_of_containers.each_with_index do |container_size, i|
			#puts tabs + "#{liters_to_contain} filled a container of size #{container_size}" 
			leftover = liters_to_contain - container_size
			leftover_containers = (i+1 < len ? list_of_containers[(i+1)..len] : []) 
			#puts "leftover: " + leftover_containers.to_s
			if ( leftover == 0 )
				count += 1
			elsif leftover_containers.length > 0
				#puts tabs + "#{leftover} leftover and #{leftover_containers} to fill" 
				count += combinations(leftover_containers, leftover)
			end
		end
		count
	end
end