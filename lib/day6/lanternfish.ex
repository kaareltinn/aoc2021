defmodule AOC.Day6.Lanternfish do
  require IEx

  def part1(input, day) do
    initial_state = input |> Enum.reduce(%{}, fn val, acc ->
      Map.update(acc, val, 1, &inc/1)
    end)

    s = (1..day)
    |> Enum.reduce(spawn_lanternfish(initial_state), fn day, previous_state ->
      # IO.inspect(previous_state)
      if day == 1 do
        previous_state
      else
        spawn_lanternfish(previous_state)
      end
    end)

    r = Enum.reduce(s, 0, fn ({_, v}, acc) ->
      acc + v
    end)
  end

  def spawn_lanternfish(state) do
    Enum.reduce(state, %{}, fn ({k, v}, acc) ->
      case k do
        1 -> Map.put(acc, 0, v)
        2 -> Map.put(acc, 1, v)
        3 -> Map.put(acc, 2, v)
        4 -> Map.put(acc, 3, v)
        5 -> Map.put(acc, 4, v)
        6 -> Map.put(acc, 5, v)
        7 -> Map.update(acc, 6, v, fn ev -> ev + v end)
        8 -> Map.put(acc, 7, v)
        0 -> Map.update(acc, 6, v, fn ev -> ev + v end) |> Map.merge(%{8 => v})
      end
    end)
  end

  defp inc(val), do: val + 1
end
