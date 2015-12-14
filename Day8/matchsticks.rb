class Matchsticks
	class Matchstick < Struct.new(:code_length, :string_length, :encode_length)
	end
	
	def self.escape_count(lines)
		sum = 0		
		lines.each do |line|
			data = parse(line)
			sum += (data.code_length - data.string_length)
		end
		sum
	end
	
	def self.total_encode_count(lines)
		sum = 0		
		lines.each do |line|
			data = encode_count(line)
			puts "encode: #{ data.encode_length }; code: #{ data.code_length } of : #{ line }";
			sum += (data.encode_length - data.code_length)
		end
		sum
	end
	
	def self.parse(line) 
		code_length = line.length
		
		line = line.gsub(/(^"|"$)/, "")
		#puts "after end subsitutes: " + line
		line = line.gsub(/\\(x[0-9a-f]{2}|"|\\)/, " ") #arbitrary character
		#puts "after other substitutes: " + line
		
		string_length = line.length
		
		Matchstick.new(code_length, string_length, 0)
	end
	
	def self.encode_count(line) 
		code_length = line.length
		puts line
		#line = line.gsub(/(\\(x[0-9a-f]{2}|"|\\))/, "\\\\1") #arbitrary character
		#puts "after other substitutes: " + line
		#line = line.gsub(/((^")|("$))/, '\2\"\3')
		#puts "after end subsitutes: " + line
		encoded_line = "\""
		line.split("").each do |char|
			if ( char == "\"" ) 
				encoded_line += '\"'
			elsif ( char == "\\" )
				encoded_line += "\\\\"
			else
				encoded_line += char
			end
		end
		encoded_line += "\""
		encode_length = encoded_line.length
		
		Matchstick.new(code_length, 0, encode_length)
	end
end