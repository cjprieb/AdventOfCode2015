require 'json'

class Budget
	def self.sum(input)
		json = JSON.parse(input)
		#file is formated as an array
		process_array(json, 0)
	end
	
	def self.process_hash(json, index)
		sum = 0
		##check for red
		json.each do |key, value|
			if value.is_a?(Hash)
				sum += process_hash(value, index+1)
			elsif value.respond_to?('each')
				sum += process_array(value, index+1)
			elsif value.is_a?(Integer)
				sum += value.to_i
			elsif value == "red"
				return 0
			end
		end
		sum
	end
	
	def self.process_array(json, index)
		sum = 0
		##check for red
		json.each do |item|
			if item.is_a?(Hash)
				sum += process_hash(item, index+1)
			elsif item.respond_to?('each')
				sum += process_array(item, index+1)
			elsif item.is_a?(Integer)
				sum += item.to_i
			end
		end
		sum
	end
end