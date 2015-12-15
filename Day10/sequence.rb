class Sequence
	def self.transform(input, repeatNum)
		File.open("input.txt", mode="w") do |outStream|
			outStream.write(input)
		end
		
		inputFile = "input.txt"
		outputFile = "output.txt"
		count = 0
		(1..repeatNum).each do
			count = transform_string(inputFile)
			File.rename(outputFile, inputFile) 
		end
		
		return count
	end
	
	def self.transform_string(inputFile)
		output = "output.txt"
		outStream = File.open(output, mode="w")
		
		totalCount = 0
		charCount = 0
		lastChar = nil
		File.open(inputFile, mode="r") do |inStream|
			while char = inStream.getc
				if ( !(char =~ /\d/) ) then next end
				
				if (lastChar != nil && char != lastChar )
					totalCount += add_to_file(outStream, charCount.to_s + lastChar)
					charCount = 1
				else				 
					charCount += 1
				end
				lastChar = char
			end
		end 
		totalCount += add_to_file(outStream,charCount.to_s + lastChar)
		outStream.close()
		totalCount
	end
	
	def self.add_to_file(outStream, str)
		outStream.write(str)
		str.length
	end
end