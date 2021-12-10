defmodule AOC.Day9.InputParser do
  require IEx

  def parse(filename) do
    {:ok, body} = File.read(Path.join([File.cwd!, 'lib/data', filename]))

    body
    |> String.split("\n")
    |> Enum.reduce([], fn xs, acc ->
      [
        xs |> String.split("") |> Enum.reject(fn v -> v == "" end) |> Enum.map(&String.to_integer/1)
        | acc
      ]
    end)
    |> Enum.reverse
  end
end
