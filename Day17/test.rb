#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'eggnog'

class EggnogTest < Minitest::Test
  def test_parse_1
   #skip
    assert_equal 4, Eggnog.valid_combinations([20,15,10,5,5], 25)
  end
  def test_parse_2
    result = Eggnog.min_containers([20,15,10,5,5], 25)
    assert_equal 3, result.combinations, "min combination"
    assert_equal 2, result.containers_count, "containers_count"
  end
end