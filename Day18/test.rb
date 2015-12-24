#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'lights'

class LightsTest < Minitest::Test

  @@init_state = [".#.#.#",
                  "...##.",
                  "#....#",
                  "..#...",
                  "#.#..#",
                  "####.."]
                
  @@step_one = ["..##..",
                "..##.#",
                "...##.",
                "......",
                "#.....",
                "#.##.."]
              
 @@step_two = [ "..###.",
                "......",
                "..###.",
                "......",
                ".#....",
                ".#...."]

  @@step_three = ["...#..",
                  "......",
                  "...#..",
                  "..##..",
                  "......",
                  "......"]
              
  @@step_four = [ "......",
                  "......",
                  "..##..",
                  "..##..",
                  "......",
                  "......"]

  @@init_state_corners = ["##.#.#",
                  "...##.",
                  "#....#",
                  "..#...",
                  "#.#..#",
                  "####.#"]
              
  @@step_one_corners = [ "#.##.#",
                      "####.#",
                      "...##.",
                      "......",
                      "#...#.",
                      "#.####"]
              
  @@step_five_corners = [ "##.###",
                    ".##..#",
                    ".##...",
                    ".##...",
                    "#.#...",
                    "##...#"]

  def test_step_one_lights_on
    #skip
    assert_equal 15, Lights.step_to(@@init_state, 0).lights_on_count, "step one, lights on"
  end

  def test_step_one
    #skip
    assert_equal @@step_one, Lights.step_to(@@init_state, 1).lights, "step one"
  end

  def test_step_two
    #skip
    assert_equal @@step_two, Lights.step_to(@@init_state, 2).lights, "step two"
  end

  def test_step_three
    #skip
    assert_equal @@step_three, Lights.step_to(@@init_state, 3).lights, "step three"
  end

  def test_step_four
    #skip
    assert_equal @@step_four, Lights.step_to(@@init_state, 5).lights, "step four"
  end

  def test_step_four_lights_on
    #skip
    assert_equal 4, Lights.step_to(@@init_state, 4).lights_on_count, "step four, lights on"
  end

  def test_step_one_corners
    #skip
    assert_equal @@step_one_corners, Lights.step_to_corners(@@init_state, 1).lights, "step one"
  end

  def test_step_five_corners
    #skip
    assert_equal @@step_five_corners, Lights.step_to_corners(@@init_state, 5).lights, "step five"
  end

  def test_step_five_lights_on_corners
    #skip
    assert_equal 17, Lights.step_to_corners(@@init_state, 5).lights_on_count, "step five, lights on"
  end
end