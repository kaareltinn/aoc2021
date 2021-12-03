defmodule AOC.Day1.InputParser do
  def parse(filename) do
    {:ok, body} = File.read(Path.join([File.cwd!, 'lib/data', filename]))

    String.split(body, "\n")
    |> Enum.filter(fn s -> s != "" end)
    |> Enum.map(&String.to_integer/1)
  end
end
