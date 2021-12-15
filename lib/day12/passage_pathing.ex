defmodule AOC.Day12.PassagePathing do
  require IEx

  def part1(input) do
    graph = input
    |> parse_input
    |> make_graph

    get_paths(graph, [["start"]])
  end

  def get_paths(graph, paths) do
    destinations = paths |> Enum.flat_map(fn ([h|_]) ->
      if h != "end" do
        Enum.map(graph, fn {k, v} ->
          if k != "start" && Enum.member?(v, h), do: k
        end)
        |> Enum.reject(&is_nil/1)
        |> Enum.concat(Map.get(graph, h, []))
      else
        []
      end
    end) |> Enum.uniq

    new_paths = paths |> Enum.flat_map(fn [h | _] = path ->
      destinations |> Enum.map(fn dest ->
        cond do
          h == "end" -> path
          dest == h -> path
          small_cave?(dest) && Enum.member?(path, dest) -> []
          can_reach?(graph, h, dest) -> [dest | path]
          true -> path
        end
      end)
    end) |> Enum.reject(&Enum.empty?/1) |> Enum.uniq

    # destinations == []
    if length(new_paths) == length(paths) do
      paths
      |> Enum.filter(fn ([h | _]) -> h == "end" end)
      |> Enum.map(&Enum.reverse/1)
      |> Enum.count
    else

      # Notes:
        # check that if new_paths and paths are equal ?

      get_paths(graph, new_paths)
    end
  end
  # def get_paths(_graph, "end", paths) do
  #   paths |> Enum.map(fn path -> ["end" | path] end) |> Enum.map(&Enum.reverse/1)
  # end
  # def get_paths(graph, vertex, paths) do
  #   destinations = Map.get(graph, vertex, [])
  #   new_paths = paths |> Enum.map(fn path ->
  #     destinations |> Enum.map(fn dest -> [dest | path] end)
  #   end)

  #   destinations |> Enum.each(fn dest ->
  #     get_paths(graph, dest, new_paths)
  #   end)
  # end

  def all_finished?(paths) do
    paths |> Enum.all?(fn ([h|_]) -> h == "end" end)
  end

  def can_reach?(graph, from, to) do
    dests1 = Map.get(graph, from, [])
    dests2 = Map.get(graph, to, [])

    Enum.member?(dests1, to) || Enum.member?(dests2, from)
  end

  def small_cave?(cave_name) do
    String.downcase(cave_name) == cave_name
  end


  def parse_input(input) do
    input |> Enum.map(fn str -> str |> String.split("-") end)
  end

  def make_graph(input) do
    input |> Enum.reduce(%{}, fn [v1, v2], acc ->
      Map.update(acc, v1, [v2], fn current -> [v2 | current] end)
    end)
  end
end
