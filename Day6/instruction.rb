class Instruction
	attr_reader :command, :start_corner, :end_corner
	def initialize(command, start_corner, end_corner)
	    @command = command
	    @start_corner = start_corner
	    @end_corner = end_corner
	end
end