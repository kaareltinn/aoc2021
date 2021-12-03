defmodule AOC do
  alias AOC.Day1.InputParser

  def day1_part1 do
    InputParser.parse('day1_input.txt')
    |> AOC.Day1.Part1.call
  end

  def day1_part2 do
    InputParser.parse('day1_input.txt')
    |> AOC.Day1.Part2.call
  end
end
