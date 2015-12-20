class Table
	class Guest
		def initialize(name)
			@name = name
			@happiness = Hash.new(0)
		end
		
		def name
			@name
		end
		
		def setHappiness(name, unit)
			@happiness[name] = unit
		end
		
		def getHappiness(name)
			@happiness[name] 
		end
	end
	
	class Arrangment
		def initialize(order)
			@order = order
			@happiness = 0
		end
		
		def happiness
			return @happiness if @happiness > 0
			
			@happiness = 0
			len = @order.length
			(0..len-1).each do |i|
				prev = @order[(i-1)%len]
				nex = @order[(i+1)%len]
				curr = @order[i]
				@happiness += curr.getHappiness(prev.name)
				@happiness += curr.getHappiness(nex.name)
			end
			@happiness 
		end
	end

	def self.arrange(input)
		table = Table.new
		input.each do |line|
			table.add(line)
		end
		table
	end
	
	def initialize
		@guests = {}
		@happiestArrangment = nil
	end
	
	def add(line)
		if ( line =~ /(\w+) would (\w+) (\d+) happiness units by sitting next to (\w+)./ )
			#puts "Match for #{line}"
			name = $1
			units = ($2 == "gain" ? 1 : -1) * $3.to_i
			otherName = $4
			guest = @guests[name]
			if ( guest == nil )
				#puts " creating guest for #{name}"
				guest = Guest.new(name)
				@guests[name] = guest 			
			end 
			guest.setHappiness(otherName, units)
		end 
	end
	
	def guestCount
		@guests.length
	end
	
	def totalHappiness
		sortedGuests = @guests.values.sort {|x,y| x.name < y.name ? -1 : 1 }
		findPossibleArrangements(sortedGuests)
		@happiestArrangment.happiness
	end
	
	def findPossibleArrangements(sortedGuests)
		permutations = sortedGuests.length.downto(1).inject(:*)		
		@happiestArrangment = Arrangment.new(sortedGuests)
		
		array = sortedGuests
		(0..permutations-2).each do |i|
			array = nextPermutation(array)
			newArrangement = Arrangment.new(array)
			if ( newArrangement.happiness > @happiestArrangment.happiness )
				@happiestArrangment = newArrangement
			end
		end
	end
	
	def nextPermutation(array)
		clonedArray = array.clone
		n = array.length
		
		i = n-2
		while ( i >= 0 && clonedArray[i].name >= clonedArray[i+1].name ) 
			i -= 1
		end
		
		if ( i < 0 )
			swapEach(0, n-1, clonedArray)
			return clonedArray
		end
		
		j = n-1
		while ( clonedArray[i].name >= clonedArray[j].name )
			j -= 1
		end
		swap(i, j, clonedArray)
		
		swapEach(i+1, n-1, clonedArray)
		return clonedArray
	end
	
	def swapEach(j, k, array)
		while ( j < k )
			swap(j, k, array)
			j += 1
			k -= 1				
		end
	end
	
	def swap(i, j, array)
		temp = array[i]
		array[i] = array[j]
		array[j] = temp 
	end
end
