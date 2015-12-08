require_relative 'lights'

lines = File.readlines("input.txt")
lights = Lights.new
lines.each do |line|
    lights.run_command Lights.parse(line)
end
answer = lights.calculate_brightness()
puts "The lights are #{answer} bright\n"

#lights.print_lights