defmodule Day6.LanternfishTest do
  use ExUnit.Case

  test "part1" do
    input = [3,4,3,1,2]

    assert AOC.Day6.Lanternfish.part1(input, 18) == 26
    assert AOC.Day6.Lanternfish.part1(input, 80) == 5934
  end
end
