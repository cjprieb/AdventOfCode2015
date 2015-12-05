#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'Mining'

# If your secret key is abcdef, the answer is 609043, 
#   because the MD5 hash of abcdef609043 starts with five zeroes 
#   (000001dbbfa...), and it is the lowest such number to do so.

# If your secret key is pqrstuv, the lowest number it combines 
#   with to make an MD5 hash starting with five zeroes is 1048970; 
#   that is, the MD5 hash of pqrstuv1048970 looks like 000006136ef....

class MiningTest < Minitest::Test
  def test_mine_abcdef
    #skip
    assert_equal 609043, Mining.mine("abcdef", 5)
  end
  def test_mine_pqrstuv
    #skip
    assert_equal 1048970, Mining.mine("pqrstuv", 5)
  end
  def test_hash_abcdef
    hash = Mining.calculate_hash("abcdef", 609043)
    assert_equal "000001dbbfa", hash[0,11]
  end
  def test_hash_pqrstuv
    hash = Mining.calculate_hash("pqrstuv", 1048970)
    assert_equal "000006136ef", hash[0,11]
  end
  def test_valid_abcdef
    assert Mining.valid_hash("000001dbbfa", "00000")
  end
  def test_valid_pqrstuv
    assert Mining.valid_hash("000006136ef", "00000")
  end
end
