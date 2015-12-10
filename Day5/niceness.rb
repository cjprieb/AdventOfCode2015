# A nice string is one with all of the following properties:
#   It contains at least three vowels (aeiou only), like aei, xazegov, or aeiouaeiouaeiou.
#   It contains at least one letter that appears twice in a row, like xx, abcdde (dd), or aabbccdd (aa, bb, cc, or dd).
#   It does not contain the strings ab, cd, pq, or xy, even if they are part of one of the other requirements.

class Niceness
	@@vowels = ['a','e','i','o','u']
	@@invalidPairs = ["ab","cd","pq","xy"]

	def self.is_nice_obsolete(str)
		vowelCnt = 0
		hasDuplicate = false
		hasInvalidPair = false
		
		strArray = str.split("")
		
		for i in 0..(str.length)
			letter = strArray[i]
			if ( @@vowels.include?(letter) ) 
				vowelCnt += 1
			end
			if ( i+1 < str.length )
				 hasDuplicate = true if ( str[i+1] == letter ) 
				 
				 pair = letter + str[i+1]
				 hasInvalidPair = true if ( @@invalidPairs.include?(pair) )
			end
		end
		vowelCnt >= 3 && hasDuplicate && !hasInvalidPair
	end

	def self.is_nice(str)
		hasPair = false
		hasRepeat = false
		
		strArray = str.split("")
		pairs = Hash.new(-1)
		
		for i in 0..(str.length)
			letter = strArray[i]
			if ( i+1 < str.length ) then
				pair = letter + strArray[i+1]
				prevIndex = pairs[pair]
				if ( prevIndex < 0 ) then
					pairs[pair] = i				
				elsif ( prevIndex+1 < i ) then
				 	hasPair = true
				end
			end
			if ( i+2 < str.length )
				hasRepeat = true if (str[i+2] == letter) 
			end
		end
		
		hasPair && hasRepeat
	end
	
	def self.count_nice_strings(data)
		total = 0
		data.each_with_index do |str,index| 
			total += 1 if is_nice(str)
		end
		total
	end
end