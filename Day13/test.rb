#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'Table'

class TableTest < Minitest::Test
  def test_arrangement
    table = Table.arrange(File.readlines("test_input.txt"))
    assert_equal 4, table.guestCount
    assert_equal 330, table.totalHappiness
  end
end
