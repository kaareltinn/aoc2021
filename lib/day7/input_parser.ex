defmodule AOC.Day7.InputParser do
  def parse(filename) do
    {:ok, body} = File.read(Path.join([File.cwd!, 'lib/data', filename]))

    body |> String.trim |> String.split(",") |> Enum.map(&String.to_integer/1)
  end
end
