require 'digest/md5'
# Santa needs help mining some AdventCoins (very similar to bitcoins) to use 
# as gifts for all the economically forward-thinking little girls and boys.
#
# To do this, he needs to find MD5 hashes which, in hexadecimal, start with 
# at least five zeroes. The input to the MD5 hash is some secret key (your puzzle 
# input, given below) followed by a number in decimal. To mine AdventCoins, you must 
# find Santa the lowest positive number (no leading zeroes: 1, 2, 3, ...) that 
# produces such a hash.
class Mining
	def self.mine(secret_key, zeroCnt)
		hashCnt = 0
		zeros = "0" * zeroCnt
		puts "Mining started: " + Time.now.getutc.to_s
		begin 
			hashCnt += 1
			hash = calculate_hash(secret_key, hashCnt)
		end while ( !valid_hash(hash, zeros) )
		puts "Mining complete: " + Time.now.getutc.to_s
		hashCnt
	end
	
	def self.calculate_hash(secret_key, num)
		Digest::MD5.hexdigest(secret_key + num.to_s)
	end
	
	def self.valid_hash(hash, zeros)
		hash[0,zeros.length] == zeros
	end
end