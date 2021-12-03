defmodule AOC.Day2.InputParser do
  require IEx

  def parse(filename) do
    {:ok, body} = File.read(Path.join([File.cwd!, 'lib/data', filename]))

    body
    |> String.split("\n")
    |> Enum.filter(fn s -> s != "" end)
    |> Enum.map(fn line ->
      [command, value] = line |> String.split(" ")

      {String.to_atom(command), String.to_integer(value)}
    end)
  end
end
