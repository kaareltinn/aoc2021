defmodule AOC.Day9.SmokeBasin do
  require IEx

  def part1(input) do
    map = input |> to_map

    map
    |> Enum.filter(fn ({k, v}) ->
      get_adjacent_positions(k)
        |> Enum.map(fn pos -> map[pos] end)
        |> Enum.reject(&is_nil/1)
        |> Enum.all?(fn adj_v -> adj_v > v end)
    end)
    |> Enum.map(fn ({_, v}) -> v + 1 end)
    |> Enum.sum
  end

  def part2(input) do
    map = input |> to_map
  end

  def to_map(input) do
    input
    |> Enum.with_index
    |> Enum.reduce(%{}, fn ({row, i}, acc1) ->
      row
      |> Enum.with_index
      |> Enum.reduce(acc1, fn ({v, j}, acc2) ->
        Map.put_new(acc2, {i, j}, v)
      end)
    end)
  end

  def get_adjacent_positions({x, y}) do
    [
      {x, y - 1}, # left
      {x - 1, y}, # up
      {x, y + 1}, # right
      {x + 1, y}, # down
    ]
  end
end
