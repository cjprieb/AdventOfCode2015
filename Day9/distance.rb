class Distance
	class Route
		attr_reader :places, :distance
		attr_writer :places, :distance
		def initialize
			@places = []
			@distance = 0
		end
	end
	
	class Place < Struct.new(:name, :edges)
	end
	
	class RouteEdge < Struct.new(:to_place, :distance)
	end
	
	def places
		@places
	end
	
	def initialize()
		@places = {}
	end
	
	def shortest_route()
		shortest_route = nil
		
		@places.each do |name, place|
			route = find_shortest([name], place)
			if ( route == nil ) then next end
			
			route.places.push(name)
			
			shortest_route = route if ( shortest_route == nil || route.distance < shortest_route.distance )
		end
		
		shortest_route
	end
	
	def find_shortest(added_places, place)
		shortest_route = nil
		
		place.edges.each do |edge|
			name = edge.to_place.name
			if ( added_places.include?(name) ) then next end
			
			route = find_shortest([name].concat(added_places), edge.to_place)			
			if ( route == nil ) then next end
			
			route.distance += edge.distance
			route.places.push(name)
			
			shortest_route = route if ( shortest_route == nil || route.distance < shortest_route.distance )
		end
		
		if ( added_places.length == @places.length ) #all places have been looked at, so return 0
			shortest_route = Route.new
		end
		
		shortest_route
	end
	
	def longest_route()
		longest_route = nil
		
		@places.each do |name, place|
			route = find_longest([name], place)
			if ( route == nil ) then next end
			
			route.places.push(name)
			
			longest_route = route if ( longest_route == nil || route.distance > longest_route.distance )
		end
		
		longest_route
	end
	
	def find_longest(added_places, place)
		longest_route = nil
		
		place.edges.each do |edge|
			name = edge.to_place.name
			if ( added_places.include?(name) ) then next end
			
			route = find_longest([name].concat(added_places), edge.to_place)			
			if ( route == nil ) then next end
			
			route.distance += edge.distance
			route.places.push(name)
			
			longest_route = route if ( longest_route == nil || route.distance > longest_route.distance )
		end
		
		if ( added_places.length == @places.length ) #all places have been looked at, so return 0
			longest_route = Route.new
		end
		
		longest_route
	end
	
	def add_to_route(line)
		if ( line =~ /(\w+) to (\w+) = (\d+)/ ) 
			@places[$1] = Place.new($1, []) if ( @places[$1] == nil )
			@places[$2] = Place.new($2, []) if ( @places[$2] == nil )
			distance = $3.to_i
						
			@places[$1].edges.push(RouteEdge.new(@places[$2], distance))
			@places[$2].edges.push(RouteEdge.new(@places[$1], distance))
		end
	end
end