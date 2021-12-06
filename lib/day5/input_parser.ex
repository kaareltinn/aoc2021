defmodule AOC.Day5.InputParser do
  require IEx

  def parse(filename) do
    {:ok, body} = File.read(Path.join([File.cwd!, 'lib/data', filename]))

    body
    |> String.split("\n")
    |> Enum.filter(fn s -> s != "" end)
    |> Enum.map(fn s -> String.split(s, " -> ") end)
    |> Enum.map(fn [a, b] ->
      [
        String.split(a, ",") |> Enum.map(&String.to_integer/1) |> List.to_tuple,
        String.split(b, ",") |> Enum.map(&String.to_integer/1) |> List.to_tuple
      ]
    end)
  end
end
