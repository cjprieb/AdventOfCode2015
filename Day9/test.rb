#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'distance'

class DistanceTest < Minitest::Test
  def test_one_route
    distances = Distance.new
    distances.add_to_route('Faerun to Tristram = 65')
    assert_equal 1, distances.places["Faerun"].edges.length, "faerun edge length"
    assert_equal 1, distances.places["Tristram"].edges.length, "Tristram edge length"
    assert_equal 65, distances.places["Tristram"].edges[0].distance, "distance"
  end
  def test_two_routes
    distances = Distance.new
    distances.add_to_route('Faerun to Tristram = 65')
    distances.add_to_route('Faerun to Tambi = 129')
    assert_equal 2, distances.places["Faerun"].edges.length, "faerun edge length"
    assert_equal 1, distances.places["Tristram"].edges.length, "Tristram edge length"
    assert_equal 1, distances.places["Tambi"].edges.length, "Tambi edge length"
    assert_equal 129, distances.places["Tambi"].edges[0].distance, "distance"
  end
  def test_shortest
    distances = Distance.new
    distances.add_to_route('London to Dublin = 464')
    distances.add_to_route('London to Belfast = 518')
    distances.add_to_route('Dublin to Belfast = 141')
    route = distances.shortest_route()
    assert_equal 605, route.distance
    assert_equal 3, route.places.length
  end
  def test_longest
    distances = Distance.new
    distances.add_to_route('London to Dublin = 464')
    distances.add_to_route('London to Belfast = 518')
    distances.add_to_route('Dublin to Belfast = 141')
    route = distances.longest_route()
    assert_equal 982, route.distance
    assert_equal 3, route.places.length
  end
end
