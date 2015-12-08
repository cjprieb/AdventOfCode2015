#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'lights'
require_relative 'instruction'

class LightsTest < Minitest::Test
  def test_parse_turn_on
    data = Lights.parse("turn on 489,959 through 759,964")
    assert_equal [489,959], data.start_corner
    assert_equal [759,964], data.end_corner
    assert_equal "turn on", data.command
  end
  def test_package_toggle
    data = Lights.parse("toggle 249,291 through 350,960")
    assert_equal [249,291], data.start_corner
    assert_equal [350,960], data.end_corner
    assert_equal "toggle", data.command
  end
  def test_package_turn_off
    data = Lights.parse("turn off 556,80 through 967,675")
    assert_equal [556,80], data.start_corner
    assert_equal [967,675], data.end_corner
    assert_equal "turn off", data.command
  end
  def test_init
    lights = Lights.new
    assert_equal 1000, lights.grid.length
    assert_equal 1000, lights.grid[0].length
  end
  def test_turn_on
    lights = Lights.new
    lights.run_command(Instruction.new("turn on", [0,0], [2,2]))
    assert_equal 9, lights.calculate_brightness
  end
  def test_toggle
    lights = Lights.new
    lights.run_command(Instruction.new("turn on", [0,0], [2,2]))
    lights.run_command(Instruction.new("toggle", [0,0], [0,10]))
    assert_equal 31, lights.calculate_brightness
  end
  def test_turn_off
    lights = Lights.new
    lights.run_command(Instruction.new("turn on", [0,0], [2,2]))
    lights.run_command(Instruction.new("toggle", [0,0], [0,10]))
    lights.run_command(Instruction.new("turn off", [0,0], [3,0]))
    assert_equal 28, lights.calculate_brightness
  end
  def test_turn_off_2
    lights = Lights.new
    lights.run_command(Instruction.new("turn on", [0,0], [2,2]))
    lights.run_command(Instruction.new("toggle", [0,0], [0,10]))
    lights.run_command(Instruction.new("turn off", [0,0], [10,0]))
    assert_equal 28, lights.calculate_brightness
  end
end
