defmodule Day5.HydrotermalVentureTest do
  use ExUnit.Case


  test "part1" do
    input = [
      [{0, 9}, {5,9}],
      [{8, 0}, {0,8}],
      [{9, 4}, {3,4}],
      [{2, 2}, {2,1}],
      [{7, 0}, {7,4}],
      [{6, 4}, {2,0}],
      [{0, 9}, {2,9}],
      [{3, 4}, {1,4}],
      [{0, 0}, {8,8}],
      [{5, 5}, {8,2}],
    ]

    assert AOC.Day5.HydrotermalVenture.part1(input) == 5
  end

  test "part2" do
    input = [
      [{0, 9}, {5,9}],
      [{8, 0}, {0,8}],
      [{9, 4}, {3,4}],
      [{2, 2}, {2,1}],
      [{7, 0}, {7,4}],
      [{6, 4}, {2,0}],
      [{0, 9}, {2,9}],
      [{3, 4}, {1,4}],
      [{5, 5}, {8,2}],
      [{0, 0}, {8,8}],
    ]

    assert AOC.Day5.HydrotermalVenture.part2(input) == 12
  end
end
