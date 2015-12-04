#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'wrapping'

#    (()) and ()() both result in floor 0.
#    ((( and (()(()( both result in floor 3.
#    ))((((( also results in floor 3.
#    ()) and ))( both result in floor -1 (the first basement level).
#    ))) and )())()) both result in floor -3.

class WrappingTest < Minitest::Test
  def test_package_squarish
    assert_equal 58, Wrapping.calculate_package("2x3x4")
  end
  def test_package_long
    assert_equal 43, Wrapping.calculate_package("1x1x10")
  end
  def test_package_total
    assert_equal 101, Wrapping.total_wrapping(["1x1x10","2x3x4"])
  end
  def test_ribbon_squarish
    assert_equal 34, Wrapping.calculate_ribbon("2x3x4")
  end
  def test_ribbon_long
    assert_equal 14, Wrapping.calculate_ribbon("1x1x10")
  end
  def test_ribbon_total
    assert_equal 48, Wrapping.total_ribbon(["1x1x10","2x3x4"])
  end
end
