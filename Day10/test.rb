#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'sequence'

class SequenceTest < Minitest::Test
  def test_1
    #skip
    assert_equal 2, Sequence.transform("1", 1)
  end
  def test_2
    #skip
    assert_equal 2, Sequence.transform("1", 2)
  end
  def test_3
    #skip
    assert_equal 4, Sequence.transform("1", 3)
  end
  def test_4
    #skip
    assert_equal 6, Sequence.transform("1", 4)
  end
  def test_5
    #skip
    assert_equal 6, Sequence.transform("1", 5)
  end
end
