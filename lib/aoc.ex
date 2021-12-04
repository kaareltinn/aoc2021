defmodule AOC do
  def day1_part1 do
    AOC.Day1.InputParser.parse('day1_input.txt')
    |> AOC.Day1.Part1.call
  end

  def day1_part2 do
    AOC.Day1.InputParser.parse('day1_input.txt')
    |> AOC.Day1.Part2.call
  end

  def day2_part1 do
    AOC.Day2.InputParser.parse('day2_input.txt')
    |> AOC.Day2.Dive.call(:part1)
  end

  def day2_part2 do
    AOC.Day2.InputParser.parse('day2_input.txt')
    |> AOC.Day2.Dive.call(:part2)
  end

  def day3_part1 do
    AOC.Day3.InputParser.parse('day3_input.txt')
    |> AOC.Day3.BinaryDiagnostic.part1
  end

  def day3_part2 do
    AOC.Day3.InputParser.parse('day3_input.txt')
    |> AOC.Day3.BinaryDiagnostic.part2
  end
end
