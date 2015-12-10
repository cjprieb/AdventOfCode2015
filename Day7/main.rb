require_relative 'circuit'

lines = File.readlines("input.txt")
circuit = Circuit.new
lines.each do |line|
    circuit.addToCircuit Circuit.parse(line)
end
answer = circuit.signalAt("a")
puts "The signal at a is #{answer}\n"