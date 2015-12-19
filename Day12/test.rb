#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'budget'

class BudgetTest < Minitest::Test
  def test_num_array
    #skip
    assert_equal 6, Budget.sum('[1,2,3]')
  end
  def test_num_json
    #skip
    assert_equal 6, Budget.sum('[{"a":2,"b":4}]')
  end
  def test_deep_array
    #skip
    assert_equal 3, Budget.sum('[[[3]]]')
  end
  def test_nested_json
    #skip
    assert_equal 3, Budget.sum('[{"a":{"b":4},"c":-1}]')
  end
  def test_empty_bracket
    #skip
    assert_equal 0, Budget.sum('[]')
  end
  def test_empty_brace
    #skip
    assert_equal 0, Budget.sum('[{}]')
  end
  def test_nested_json_red
    #skip
    assert_equal 4, Budget.sum('[1,{"c":"red","b":2},3]')
  end
  def test_complex_json_red
    #skip
    assert_equal 0, Budget.sum('[{"d":"red","e":[1,2,3,4],"f":5}]')
  end
  def test_complex_json_red
    #skip
    assert_equal 4, Budget.sum('[1,{"c":"red","b":2},3,[{"d":5,"e":[1,2,3,4],"f":"red"}]]')
  end
  def test_array_red
    #skip
    assert_equal 6, Budget.sum('[1,"red",5]')
  end
  def test_two_red_and_nested
    #skip
    assert_equal 146, Budget.sum('[{"a":["red","red",146]}]')
  end
end
