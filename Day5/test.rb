#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'Niceness'

#Old Examples
#    ugknbfddgicrmopn is nice because it has at least three vowels (u...i...o...), 
#       a double letter (...dd...), and none of the disallowed substrings.
#    aaa is nice because it has at least three vowels and a double letter, 
#       even though the letters used by different rules overlap.
#    jchzalrnumimnmhp is naughty because it has no double letter.
#    haegwjzuvuyypxyu is naughty because it contains the string xy.
#    dvszwmarrgswjxmb is naughty because it contains only one vowel.

#New Examples
#    qjhvhtzxzqqjkmpb is nice because is has a pair that appears twice (qj) and a 
#       letter that repeats with exactly one letter between them (zxz).
#    xxyxx is nice because it has a pair that appears twice and a letter that repeats 
#       with one between, even though the letters used by each rule overlap.
#    uurcxstgmygtbstg is naughty because it has a pair (tg) but no repeat 
#        with a single letter between them.
#    ieodomkazucvgmuy is naughty because it has a repeating letter with one 
#       between (odo), but no pair that appears twice.

class NicenessTest < Minitest::Test
  def test_qjhvhtzxzqqjkmpb
    assert Niceness.is_nice("qjhvhtzxzqqjkmpb"), "qj and zxz (valid)"
  end
  def test_xxyxx
    assert Niceness.is_nice("xxyxx"), "xx and xyx (valid)"
  end
  def test_uurcxstgmygtbstg
    assert !Niceness.is_nice("uurcxstgmygtbstg"), "tg, but no repeat"
  end
  def test_ieodomkazucvgmuy
    assert !Niceness.is_nice("ieodomkazucvgmuy"), "repeating letters (odo), but no repeat pair"
  end
  def test_ugknbfddgicrmopn
    assert Niceness.is_nice_obsolete("ugknbfddgicrmopn")
  end
  def test_aaa
    assert Niceness.is_nice_obsolete("aaa")
  end
  def test_jchzalrnumimnmhp
    assert !Niceness.is_nice_obsolete("jchzalrnumimnmhp")
  end
  def test_haegwjzuvuyypxyu
    assert !Niceness.is_nice_obsolete("haegwjzuvuyypxyu")
  end
  def test_dvszwmarrgswjxmb
    assert !Niceness.is_nice_obsolete("dvszwmarrgswjxmb")
  end
  def test_dvszwmarrgswjxmb
    assert !Niceness.is_nice_obsolete("dvszwmarrgswjxmb")
  end
  def test_ugknbfcddgicrmopn
    assert !Niceness.is_nice_obsolete("ugknbfcddgicrmopn"), "cd is not nice"
  end
  def test_ugknbfxxygicrmopn
    assert !Niceness.is_nice_obsolete("ugknbfcxxygicrmopn"),"xy is not nice"
  end
  def test_ugknbfddgicrmopqn
    assert !Niceness.is_nice_obsolete("ugknbfddgicrmopqn"), "pq is not nice"
  end
  def test_abugknbfddgicrmopqn
    assert !Niceness.is_nice_obsolete("abugknbfddgicrmopqn"), "ab at beginning is not nice"
  end
  def test_ugknbfddgicrmopqnab
    assert !Niceness.is_nice_obsolete("ugknbfddgicrmopqnab"), "ab at end is not nice"
  end
end
