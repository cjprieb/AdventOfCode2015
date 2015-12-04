#Fortunately, every present is a box (a perfect right rectangular prism), 
#which makes calculating the required wrapping paper for each gift a little easier: 
#find the surface area of the box, which is 2*l*w + 2*w*h + 2*h*l. 
#The elves also need a little extra paper for each present: the area of the smallest side.
class Wrapping
	def self.calculate_package(package)
		smallest = 0
		sqft = 0
		if ( package =~ /(\d+)x(\d+)x(\d+)/ )
			width = $1.to_i
			height = $2.to_i
			depth = $3.to_i
			
			sides = [width*height, height*depth, width*depth]
			smallest = sides.inject(0) do |smallest, side|
				smallest == 0 || smallest > side ? side : smallest
			end
			sqft = 2 * sides.reduce(0,:+)
			sqft += smallest
		end
		sqft
	end
	def self.total_wrapping(data)
		total = 0
		data.each_with_index do |package,index| 
			total += calculate_package(package)
		end
		total
	end
	def self.calculate_ribbon(package)
		length = 0
		if ( package =~ /(\d+)x(\d+)x(\d+)/ )
			width = $1.to_i
			height = $2.to_i
			depth = $3.to_i
			length = width*height*depth #bow
			
			length += 2*[width, height, depth].sort().take(2).reduce(0,:+)
		end
		length
	end
	def self.total_ribbon(data)
		total = 0
		data.each_with_index do |package,index| 
			total += calculate_ribbon(package)
		end
		total
	end
end