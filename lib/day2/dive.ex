defmodule AOC.Day2.Dive do
  alias AOC.Day2.Submarine

  def call(input, part) do
    submarine =
      input |> Enum.reduce(Submarine.new(), update_submarine(part))

    submarine.vertical * submarine.horizontal
  end

  def update_submarine(:part1) do
    fn ({command, value}, acc) ->
      case command do
        :forward ->  %{ acc | horizontal: acc.horizontal + value }
        :up -> %{ acc | vertical: acc.vertical - value }
        :down -> %{ acc | vertical: acc.vertical + value }
      end
    end
  end

  def update_submarine(:part2) do
    fn ({command, value}, acc) ->
      case command do
        :forward ->  %{ acc | horizontal: acc.horizontal + value, vertical: acc.vertical + acc.aim * value }
        :up -> %{ acc | aim: acc.aim - value }
        :down -> %{ acc | aim: acc.aim + value }
      end
    end
  end
end
