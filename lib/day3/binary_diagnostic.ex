defmodule AOC.Day3.BinaryDiagnostic do
  require IEx

  def part1(input) do
    m = input |> transform

    mcb = Enum.map(m, &most_common_bit/1) |> Enum.join
    lcb = Enum.map(m, &least_common_bit/1) |> Enum.join

    gamma_rate = mcb |> binary_to_decimal
    epsilon_rate = lcb |> binary_to_decimal

    gamma_rate * epsilon_rate
  end

  def part2(input) do
    csr = co2_scrubber_rating(input, 0)
    ogr = oxygen_generator_rating(input, 0)

    x = ogr |> binary_to_decimal
    y = csr |> binary_to_decimal

    x * y
  end

  defp oxygen_generator_rating([result], _), do: result
  defp oxygen_generator_rating(input, count) do
    mcb = input
      |> transform
      |> Enum.at(count)
      |> most_common_bit
    input = Enum.filter(input, fn str -> String.at(str, count) == mcb end)

    oxygen_generator_rating(input, count + 1)
  end

  defp co2_scrubber_rating([result], _), do: result
  defp co2_scrubber_rating(input, count) do
    lcb = input
      |> transform
      |> Enum.at(count)
      |> least_common_bit
    input = Enum.filter(input, fn str -> String.at(str, count) == lcb end)

    co2_scrubber_rating(input, count + 1)
  end

  defp transform(input) do
    input
      |> Enum.map(fn str -> String.split(str, "") end)
      |> Enum.map(fn xs -> Enum.filter(xs, fn s -> s != "" end) end) # get rid of array of empty string ("")
      |> Enum.zip |> Enum.map(&Tuple.to_list/1) # transpose
  end

  defp most_common_bit(bits) do
    zeros = bits |> Enum.count(fn bit -> bit == "0" end)
    ones = bits |> Enum.count(fn bit -> bit == "1" end)

    if zeros > ones, do: "0", else: "1"
  end

  defp least_common_bit(bits) do
    zeros = bits |> Enum.count(fn bit -> bit == "0" end)
    ones = bits |> Enum.count(fn bit -> bit == "1" end)

    if zeros > ones, do: "1", else: "0"
  end

  defp binary_to_decimal(bits), do: bits |> Integer.parse(2) |> elem(0)
end
