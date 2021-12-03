defmodule Day2.DiveTest do
  use ExUnit.Case

  test "part1" do
    input = [
      {:forward, 5},
      {:down, 5},
      {:forward, 8},
      {:up, 3},
      {:down, 8},
      {:forward, 2},
    ]

    assert AOC.Day2.Dive.call(input, :part1) == 150
  end

  test "part2" do
    input = [
      {:forward, 5},
      {:down, 5},
      {:forward, 8},
      {:up, 3},
      {:down, 8},
      {:forward, 2},
    ]

    assert AOC.Day2.Dive.call(input, :part2) == 900
  end
end
