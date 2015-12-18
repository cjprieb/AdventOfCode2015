require 'set'

class Password
	def self.valid?(password)
		return false if ( password =~ /[iol]/ )
		
		doubleLetters = Set.new(password.scan(/(\w)\1/))
		return false if doubleLetters.length < 2
		
		lettersInRow = 0
		lastChar = nil
		password.each_char do |char|
			if ( lastChar != nil && lastChar+1 == char.ord )
				lettersInRow += 1 
				if lettersInRow >= 3
					return true
				end
			else
				lettersInRow = 1
			end
			lastChar = char.ord
		end
		return false
	end
	
	def self.next(password)
		#puts "Start #{password}"
		oldPassword = password
		password = password.clone
		count = 0
		['i','o','l'].each { |c| password = preprocess(password, c) }
		#puts "preprocess #{password}"
		begin
			password = increment(password, password.length-1)
			count += 1
			#puts "\tnext #{password}"
		end while ( password != nil && !valid?(password) ) 
		password
	end
	
	def self.preprocess(password, invalidChar)
		i = password.index(invalidChar)
		if ( i != nil )
			password[i] = (password[i].ord + 1).chr
			(i+1...password.length-1).each do |j|
				password[j] = 'a'
			end
		end
		password
	end
	
	def self.increment(password, i)
		currChar = password[i]
		case ( currChar )
		when "z"
			return nil if ( i-1 < 0 ) 
			
			password[i] = 'a'
			increment(password, i-1) 
		when /[hkn]/ #next letters are [ilo], so advance twice
			password[i] = (currChar.ord + 2).chr
		else
			password[i] = (currChar.ord + 1).chr
		end	
		return password
	end
end