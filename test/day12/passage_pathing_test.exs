defmodule AOC.Day12.PassagePathingTest do
  use ExUnit.Case

  test "part1 vol1" do
    input = [
      "start-A",
      "start-b",
      "A-c",
      "A-b",
      "b-d",
      "A-end",
      "b-end",
    ]

    assert AOC.Day12.PassagePathing.part1(input) == 10
  end

  test "part1 vol2" do
    input = [
      "dc-end",
      "HN-start",
      "start-kj",
      "dc-start",
      "dc-HN",
      "LN-dc",
      "HN-end",
      "kj-sa",
      "kj-HN",
      "kj-dc",
    ]

    assert AOC.Day12.PassagePathing.part1(input) == 19
  end

  test "part1 vol3" do
    input = [
      "fs-end",
      "he-DX",
      "fs-he",
      "start-DX",
      "pj-DX",
      "end-zg",
      "zg-sl",
      "zg-pj",
      "pj-he",
      "RW-he",
      "fs-DX",
      "pj-RW",
      "zg-RW",
      "start-pj",
      "he-WI",
      "zg-he",
      "pj-fs",
      "start-RW",
    ]

    assert AOC.Day12.PassagePathing.part1(input) == 226
  end
end
