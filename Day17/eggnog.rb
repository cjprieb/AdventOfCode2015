Result = Struct.new(:containers_count, :combinations) do 
end

class Eggnog
	
	def self.parse(input)
		input.map { |line| line.to_i }
	end
	
	def self.valid_combinations(container_list, liters_to_contain)
		eggnog = Eggnog.new(container_list)
		return eggnog.count_combinations(container_list, liters_to_contain, 0)
	end
	
	def self.min_containers(container_list, liters_to_contain)
		eggnog = Eggnog.new(container_list)
		eggnog.count_combinations(container_list, liters_to_contain, 0)
		eggnog
	end	
	
	def initialize(container_list)
		@combo_map = Hash.new(0)
		@orig_container_list = container_list
		#puts "original container list length: #{@orig_container_list.length}"
	end
	
	def count_combinations(container_list, liters_to_contain, containers_used_count)
		count = 0
		len = container_list.length
		#tabs = "\t" * (5-len)
		container_list.each_with_index do |container_size, i|
			#puts tabs + "container: #{container_size}"
			#puts tabs + "#{liters_to_contain} filled a container of size #{container_size}" 
			leftover = liters_to_contain - container_size
			leftover_containers = (i+1 < len ? container_list[(i+1)..len] : []) 
			#puts "leftover: " + leftover_containers.to_s
			if ( leftover == 0 )
				#puts tabs +"  given list length: #{container_list.length}"
				#puts tabs +"  leftover list length: #{leftover_containers.length}"
				#puts tabs +"  containers_used_count: #{containers_used_count}"
				@combo_map[containers_used_count + 1] += 1
				count += 1
			elsif leftover_containers.length > 0
				#puts tabs + "#{leftover} leftover and #{leftover_containers} to fill" 
				count += count_combinations(leftover_containers, leftover, containers_used_count+1)
			end
		end
		count
	end
	
	def combinations
		min_key = @combo_map.keys.min
		@combo_map[min_key]
	end
	
	def containers_count
		@combo_map.keys.min
	end
end