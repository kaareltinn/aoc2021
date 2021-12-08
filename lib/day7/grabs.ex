defmodule AOC.Day7.Grabs do
  require IEx

  def part1(input) do
    uniq_values = input |> Enum.uniq

    Enum.map(uniq_values, fn pos ->
      calculate_fuel_part1(input, pos)
    end) |> Enum.min
  end

  def part2(input) do
    uniq_values = input |> Enum.uniq

    [{_, pos1}, {_, pos2}] = Enum.map(uniq_values, fn pos ->
      {calculate_fuel_part2(input, pos), pos}
    end)
    |> Enum.sort(fn ({f1, _},{f2, _}) -> f1 <= f2 end)
    |> Enum.take(2)

    (pos1..pos2) |> Enum.map(fn pos ->
      calculate_fuel_part2(input, pos)
    end) |> Enum.min
  end

  def calculate_fuel_part1(input, position) do
    Enum.reduce(input, 0, fn pos, acc ->
      acc + abs(pos - position)
    end)
  end

  def calculate_fuel_part2(input, position) do
    Enum.reduce(input, 0, fn pos, acc ->
      x = abs(pos - position)
      acc + (Enum.sum(1..x))
    end)
  end
end
