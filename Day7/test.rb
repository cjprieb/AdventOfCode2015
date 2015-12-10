#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'circuit'

class CircuitTest < Minitest::Test
  def test_parse_signal_to
    data = Circuit.parse("128 -> x")
    assert_equal 128, data.wires[0].to_i
    assert_equal "x", data.name
  end
  def test_parse_and
    data = Circuit.parse("x AND y -> z")
    assert_equal "and", data.mode
    assert_equal 2, data.wires.length
    assert_equal "x", data.wires[0]
    assert_equal "y", data.wires[1]
    assert_equal "z", data.name
  end
  def test_parse_and_2
    data = Circuit.parse("1 AND r -> s")
    assert_equal "and", data.mode
    assert_equal 2, data.wires.length
    assert_equal "1", data.wires[0]
    assert_equal "r", data.wires[1]
    assert_equal "s", data.name
  end
  def test_parse_lshift
    data = Circuit.parse("p LSHIFT 2 -> q")
    assert_equal "lshift", data.mode
    assert_equal 2, data.wires.length
    assert_equal "p", data.wires[0]
    assert_equal "2", data.wires[1]
    assert_equal "q", data.name
  end
  def test_parse_not
    data = Circuit.parse("NOT e -> f")
    assert_equal "not", data.mode
    assert_equal "e", data.wires[0]
    assert_equal "f", data.name
  end
  def test_parse_pass
    data = Circuit.parse("e -> f")
    assert_equal "e", data.wires[0]
    assert_equal "f", data.name
  end
  def test_run_simple_circuit
    data = ["123 -> x",
      "456 -> y",
      "x AND y -> d",
      "x OR y -> e",
      "x LSHIFT 2 -> f",
      "y RSHIFT 2 -> g",
      "NOT x -> h",
      "NOT y -> i"]
    circuit = Circuit.new
    data.each do |line|
        circuit.addToCircuit Circuit.parse(line)
    end
    assert_equal 123, circuit.signalAt("x"), "x"
    assert_equal 456, circuit.signalAt("y"), "y"
    assert_equal 72, circuit.signalAt("d"), "d"
    assert_equal 507, circuit.signalAt("e"), "e"
    assert_equal 492, circuit.signalAt("f"), "f"
    assert_equal 114, circuit.signalAt("g"), "g"
    assert_equal 65412, circuit.signalAt("h"), "h"
    assert_equal 65079, circuit.signalAt("i"), "i"
  end
  def test_run_simple_circuit_2
    data = ["123 -> x",
      "456 -> y",
      "123 AND y -> d",
      "d -> f"]
    circuit = Circuit.new
    data.each do |line|
        circuit.addToCircuit Circuit.parse(line)
    end
    assert_equal 123, circuit.signalAt("x"), "x"
    assert_equal 456, circuit.signalAt("y"), "y"
    assert_equal 72, circuit.signalAt("d"), "d"
    assert_equal 72, circuit.signalAt("f"), "f"
  end
end
