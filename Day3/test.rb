#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'world'


#    > delivers presents to 2 houses: one at the starting location, and one to the east.
#    ^>v< delivers presents to 4 houses in a square, including twice to the house at his starting/ending location.
#    ^v^v^v^v^v delivers a bunch of presents to some very lucky children at only 2 houses.


class WorldTest < Minitest::Test
  def test_deliver_simple
    assert_equal 2, World.deliver(">")
  end
  def test_deliver_square
    assert_equal 4, World.deliver("^>v<")
  end
  def test_deliver_back_and_forth
    assert_equal 2, World.deliver("^v^v^v^v^v")
  end
  def test_deliver_with_robot_simple
    assert_equal 3, World.deliver_with_robot("^v")
  end
  def test_deliver_with_robot_square
    assert_equal 3, World.deliver_with_robot("^>v<")
  end
  def test_deliver_with_robot_back_and_forth
    assert_equal 11, World.deliver_with_robot("^v^v^v^v^v")
  end
end
