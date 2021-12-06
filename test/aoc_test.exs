defmodule AOCTest do
  use ExUnit.Case
  doctest AOC

  test "day1 part1" do
    assert AOC.day1_part1() == 1448
  end

  test "day5 part2" do
    assert AOC.day5_part2() == 21466
  end
end
