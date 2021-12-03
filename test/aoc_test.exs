defmodule AOCTest do
  use ExUnit.Case
  doctest AOC

  test "day1 part1" do
    assert AOC.day1_part1() == 1448
  end
end
