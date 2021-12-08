defmodule Day7.GrabsTest do
  use ExUnit.Case

  test "part1" do
    input = [16,1,2,0,4,2,7,1,2,14]

    assert AOC.Day7.Grabs.part1(input) == 37
  end

  test "part2" do
    input = [16,1,2,0,4,2,7,1,2,14]

    assert AOC.Day7.Grabs.part2(input) == 168
  end
end
