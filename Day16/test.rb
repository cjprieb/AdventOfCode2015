#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'sue'

class AnalysisTest < Minitest::Test
  def test_parse_1
    sue = Sue.new("Sue 1: goldfish: 6, trees: 9, akitas: 0")
    assert_equal 1, sue.id
    assert_equal 6, sue.properties["goldfish"], "goldfish"
    assert_equal 9, sue.properties["trees"], "trees"
    assert_equal 0, sue.properties["akitas"], "akitas"
  end
  def test_parse_10
    sue = Sue.new("Sue 10: perfumes: 10, trees: 6, cars: 4")
    assert_equal 10, sue.id
    assert_equal 10, sue.properties["perfumes"], "perfumes"
    assert_equal 6, sue.properties["trees"], "tress"
    assert_equal 4, sue.properties["cars"], "cars"
  end
end