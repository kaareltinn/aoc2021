defmodule AOC.Day1.Part2 do
  alias AOC.Day1.Part1

  def call(input) do
    input |> transform |> Part1.call
  end

  def transform(input) do
    { xs, _ } = input
    |> Enum.reduce_while(initial_state(), fn (_, { acc, start }) ->
      try do
        acc = [ compute(input, start) | acc ]
        {:cont, { acc, start + 1 }}
      rescue
        RuntimeError -> {:halt, { acc, start }}
      end
    end)

    xs |> Enum.reverse
  end

  defp compute(xs, start) do
    elems = [ Enum.at(xs, start), Enum.at(xs, start + 1), Enum.at(xs, start + 2) ]
    if Enum.any?(elems, &is_nil/1) do
      raise "oops"
    else
      Enum.sum(elems)
    end
  end

  defp initial_state, do: { [], 0 }
end
