#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'password'

class PasswordTest < Minitest::Test
  def test_valid_hijklmmn
    #skip
    assert !Password.valid?("hijklmmn"), "has hij, but also i and l"
  end
  def test_valid_abbceffg
    #skip
    assert !Password.valid?("abbceffg"), "has double bb and ff, but no three in a row"
  end
  def test_valid_abbcegjk
    #skip
    assert !Password.valid?("abbcegjk"), "only one double letter"
  end
  def test_valid_abcdffaa
    #skip
    assert Password.valid?("abcdffaa"), "is valid"
  end
  def test_valid_ghjaabcc
    #skip
    assert Password.valid?("ghjaabcc"), "is valid"
  end
  def test_next_abcdefgh
    #skip
    assert_equal "abcdffaa", Password.next("abcdefgh")
  end
  def test_next_ghijklmn
    #skip
    assert_equal "ghjaabcc", Password.next("ghijklmn")
  end
  def test_next_ghijklmz
    #skip
    assert_equal "ghjaabcc", Password.next("ghijklmz")
  end
end
