require_relative 'mining'

input = "yzbqklnj"

answer = Mining.mine(input, 5)
puts "First AdventCoin with 5 zeros at #{ answer }." # 2 seconds

answer = Mining.mine(input, 6)
puts "First AdventCoin with 6 zeros at #{ answer }." # 35 seconds