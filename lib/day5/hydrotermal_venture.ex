defmodule AOC.Day5.HydrotermalVenture do
  require IEx

  def part1(input) do
    overlaps = %{}

    lines = input |> Enum.filter(fn [{x1,y1}, {x2, y2}] ->
      x1 == x2 || y1 == y2
    end)

    points = Enum.map(lines, fn points ->
      calculate_points(points)
    end) |> List.flatten

    overlaps = Enum.reduce(points, overlaps, fn (point, acc) ->
      Map.update(acc, point, 1, fn v -> v + 1 end)
    end)

    Enum.filter(overlaps, fn {_k, v} -> v > 1 end) |> Enum.count
  end

  def part2(input) do
    overlaps = %{}

    points = Enum.map(input, fn points ->
      calculate_points(points)
    end) |> List.flatten


    overlaps = Enum.reduce(points, overlaps, fn (point, acc) ->
      Map.update(acc, point, 1, fn v -> v + 1 end)
    end)

    Enum.filter(overlaps, fn {_k, v} -> v > 1 end) |> Enum.count
  end

  def calculate_points([{x1, y1}, {x2, y2}] = points) do
    m = slope(points)
    b = intercept(points, m)

    cond do
      y1 == y2 && m == 0 -> (x1..x2) |> Enum.map(fn x -> {x, y1} end)
      x1 == x2 && m == 0 -> (y1..y2) |> Enum.map(fn y -> {x1, y} end)
      x1 == y1 && x2 == y2 -> (x1..x2) |> Enum.map(fn x -> {x, x} end)
      m == 1 -> (x1..x2) |> Enum.map(fn x -> {x, trunc(x + b)} end)
      m == -1 -> (x1..x2) |> Enum.map(fn x -> {x, trunc(-x + b)} end)
    end
  end

  def slope([{x1,y1}, {x2, y2}]) do
    rise = y2 - y1
    run = x2 - x1

    try do
      rise / run
    rescue
      ArithmeticError -> 0
    end
  end

  def intercept([{x, y}, _], m) do
    try do
      # y = m * x + b
      # y - (m * x) = b
      y - (m * x)
    rescue
      ArithmeticError -> 0
    end
  end
end
