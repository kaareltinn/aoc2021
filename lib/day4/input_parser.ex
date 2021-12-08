defmodule AOC.Day4.InputParser do
  def parse(filename) do
    {:ok, body} = File.read(Path.join([File.cwd!, 'lib/data', filename]))

    [nums | boards] = body
    |> String.split("\n")

    nums1 = nums |> String.split(",") |> Enum.map(&String.to_integer/1)
    boards = boards
             |> Enum.filter(fn x -> x != "" end) |> Enum.map(fn s -> String.split(s, "\n") |> Enum.map(&String.split/1) end)
             |> List.flatten |> Enum.map(&String.to_integer/1) |> Enum.chunk_every(25)

    {boards, nums1}
  end
end
