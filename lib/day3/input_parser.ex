defmodule AOC.Day3.InputParser do
  def parse(filename) do
    {:ok, body} = File.read(Path.join([File.cwd!, 'lib/data', filename]))

    body
    |> String.split("\n")
    |> Enum.filter(fn s -> s != "" end)
  end
end
