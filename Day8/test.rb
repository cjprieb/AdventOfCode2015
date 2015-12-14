#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'matchsticks'

class MatchsticksTest < Minitest::Test
  def test_empty_string
    data = Matchsticks.parse('""')
    assert_equal 2, data.code_length, "code_length"
    assert_equal 0, data.string_length, "string_length"
  end
  def test_abc_string
    data = Matchsticks.parse('"abc"')
    assert_equal 5, data.code_length, "code_length"
    assert_equal 3, data.string_length, "string_length"
  end
  def test_a_quote
    data = Matchsticks.parse('"aaa\\"aaa"')
    assert_equal 10, data.code_length, "code_length"
    assert_equal 7, data.string_length, "string_length"
  end
  def test_hex_num
    data = Matchsticks.parse('"\\x27"')
    assert_equal 6, data.code_length, "code_length"
    assert_equal 1, data.string_length, "string_length"
  end
  def test_hex_char
    data = Matchsticks.parse('"\\xbc"')
    assert_equal 6, data.code_length, "code_length"
    assert_equal 1, data.string_length, "string_length"
  end
  def test_backslash
    data = Matchsticks.parse('"aaa\\\\aaad"')
    assert_equal 11, data.code_length, "code_length"
    assert_equal 8, data.string_length, "string_length"
  end ##
  def test_encode_empty_string
    data = Matchsticks.encode_count('""')
    assert_equal 2, data.code_length, "code_length"
    assert_equal 6, data.encode_length, "encode_length"
  end
  def test_encode_abc_string
    data = Matchsticks.encode_count('"abc"')
    assert_equal 5, data.code_length, "code_length"
    assert_equal 9, data.encode_length, "encode_length"
  end
  def test_encode_a_quote
    data = Matchsticks.encode_count('"aaa\\"aaa"')
    assert_equal 10, data.code_length, "code_length"
    assert_equal 16, data.encode_length, "encode_length"
  end
  def test_encode_hex_num
    data = Matchsticks.encode_count('"\\x27"')
    assert_equal 6, data.code_length, "code_length"
    assert_equal 11, data.encode_length, "encode_length"
  end
  def test_encode_hex_char
    data = Matchsticks.encode_count('"\\xbc"')
    assert_equal 6, data.code_length, "code_length"
    assert_equal 11, data.encode_length, "encode_length"
  end
  def test_encode_backslash
    data = Matchsticks.encode_count('"aaa\\\\aaad"')
    assert_equal 11, data.code_length, "code_length"
    assert_equal 17, data.encode_length, "encode_length"
  end
  def test_total
    input = [
      '""','"abc"','"aaa\\\"aaa"','"\\x27"'
    ]
    assert_equal 12, Matchsticks.escape_count(input)
  end
  def test_total_encode
    input = [
      '""','"abc"','"aaa\\"aaa"','"\\x27"'
    ]
    assert_equal 19, Matchsticks.total_encode_count(input)
  end
end
