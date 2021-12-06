defmodule AOC do
  require IEx

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

  def day4_part1 do
    {boards, numbers} = AOC.Day4.InputParser.parse('day4_input.txt')
    AOC.Day4.GiantSquid.part1(boards, numbers)
  end

  def day4_part2 do
    {boards, numbers} = AOC.Day4.InputParser.parse('day4_input.txt')
    AOC.Day4.GiantSquid.part2(boards, numbers)
  end

  def day5_part1 do
    input = AOC.Day5.InputParser.parse('day5_input.txt')
    AOC.Day5.HydrotermalVenture.part1(input)
  end

  def day5_part2 do
    input = AOC.Day5.InputParser.parse('day5_input.txt')
    AOC.Day5.HydrotermalVenture.part2(input)
  end
end
