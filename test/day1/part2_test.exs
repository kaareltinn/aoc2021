defmodule Day1.Part2Test do
  use ExUnit.Case

  test "call" do
    input = [
      199,  # A
      200,  # A B
      208,  # A B C
      210,  #   B C D
      200,  # E   C D
      207,  # E F   D
      240,  # E F G
      269,  #   F G H
      260,  #     G H
      263,  #       H
    ]

    assert AOC.Day1.Part2.call(input) == 5
  end

  test "transform" do
    input = [
      199,  # A
      200,  # A B
      208,  # A B C
      210,  #   B C D
      200,  # E   C D
      207,  # E F   D
      240,  # E F G
      269,  #   F G H
      260,  #     G H
      263,  #       H
    ]

    assert(
      [
        607,
        618,
        618,
        617,
        647,
        716,
        769,
        792,
      ] = AOC.Day1.Part2.transform(input)
    )
  end
end
