#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'olympics'

class OlympicsTest < Minitest::Test
  def test_one_second
    winner = Olympics.winner_after(File.readlines("test_input.txt"), 1)
    assert_equal "Dancer", winner.name
    assert_equal 16, winner.distance
  end
  def test_ten_seconds
    winner = Olympics.winner_after(File.readlines("test_input.txt"), 10)
    assert_equal "Dancer", winner.name
    assert_equal 160, winner.distance
  end
  def test_twelve_seconds
    winner = Olympics.winner_after(File.readlines("test_input.txt"), 12)
    assert_equal "Dancer", winner.name
    assert_equal 176, winner.distance
  end
  def test_one_thousand_second
    winner = Olympics.winner_after(File.readlines("test_input.txt"), 1000)
    assert_equal "Comet", winner.name
    assert_equal 1120, winner.distance
  end
  def test_one_second_points
    winner = Olympics.winner_after(File.readlines("test_input.txt"), 1, "points")
    assert_equal "Dancer", winner.name
    assert_equal 1, winner.points
  end
  def test_one_forty_seconds_points
    winner = Olympics.winner_after(File.readlines("test_input.txt"), 140, "points")
    assert_equal "Dancer", winner.name
    assert_equal 139, winner.points
  end
  def test_one_thousand_second_points
    winner = Olympics.winner_after(File.readlines("test_input.txt"), 1000, "points")
    assert_equal "Dancer", winner.name
    assert_equal 689, winner.points
  end
end
