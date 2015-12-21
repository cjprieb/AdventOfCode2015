#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'recipe'

class RecipeTest < Minitest::Test
  def test_two_items
    recipe = Recipe.new
    score = recipe.best_cookie(File.readlines("test_input.txt"), 100)
    assert_equal 62842880, score
  end
end