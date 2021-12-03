defmodule AOC.Day1.Part1 do
  def call(input) do
    input |> count
  end

  defp count(xs) do
    xs
    |> Enum.with_index
    |> Enum.reduce(0, fn ({ cur, i }, acc) ->
      case Enum.at(xs, i - 1, :none) do
        :none -> acc
        prev -> if cur > prev, do: acc + 1, else: acc
      end
    end)
  end
end
