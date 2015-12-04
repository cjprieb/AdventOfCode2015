#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'elevator'

#    (()) and ()() both result in floor 0.
#    ((( and (()(()( both result in floor 3.
#    ))((((( also results in floor 3.
#    ()) and ))( both result in floor -1 (the first basement level).
#    ))) and )())()) both result in floor -3.

class ElevatorTest < Minitest::Test
  def test_floor_0_nested
    assert_equal 0, Elevator.move("(())")
  end
  def test_floor_0_sideways
    assert_equal 0, Elevator.move("()()")
  end
  def test_floor_3_simple
    assert_equal 3, Elevator.move("(((")
  end
  def test_floor_3_confused
    assert_equal 3, Elevator.move("(()(()(")
  end
  def test_floor_3_down_up
    assert_equal 3, Elevator.move("))(((((")
  end
  def test_floor_neg_1_up_down
    assert_equal -1, Elevator.move("())")
  end
  def test_floor_neg_1_down_up
    assert_equal -1, Elevator.move("))(")
  end
  def test_floor_neg_3_simple
    assert_equal -3, Elevator.move(")))")
  end
  def test_floor_neg_3_confused
    assert_equal -3, Elevator.move(")())())")
  end
  def test_first_at_simple
    assert_equal 1, Elevator.first_at(")", -1)
  end
  def test_first_at_complex
    assert_equal 5, Elevator.first_at("()())", -1)
  end
end
