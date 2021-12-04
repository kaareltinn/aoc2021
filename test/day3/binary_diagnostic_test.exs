defmodule Day3.BinaryDiagnosticTest do
  use ExUnit.Case

  test "part1" do
    input = [
      "00100",
      "11110",
      "10110",
      "10111",
      "10101",
      "01111",
      "00111",
      "11100",
      "10000",
      "11001",
      "00010",
      "01010",
    ]

    assert AOC.Day3.BinaryDiagnostic.part1(input) == 198
  end

  test "part2" do
    input = [
      "00100",
      "11110",
      "10110",
      "10111",
      "10101",
      "01111",
      "00111",
      "11100",
      "10000",
      "11001",
      "00010",
      "01010",
    ]

    assert AOC.Day3.BinaryDiagnostic.part2(input) == 230
  end
end
