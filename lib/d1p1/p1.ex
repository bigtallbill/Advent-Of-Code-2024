defmodule D1p1.P1 do
  def run do
    input = File.read!("lib/d1p1/input.txt")
    IO.inspect(calc_distances(input) |> Enum.sum())
  end

  def calc_distances(input) do
    input
    |> parse_input()
    |> split_lists()
    |> Enum.map(fn {l, r} -> abs(l - r) end)
  end

  def parse_input(input) do
    input
    |> String.split("\n")
    |> Enum.map(fn line ->
      line
      |> String.split("   ")
      # Remove empty strings
      |> Enum.reject(&(&1 == ""))
    end)
    # Remove empty lists
    |> Enum.reject(&(&1 == []))
  end

  def split_lists(original_list) do
    left = Enum.map(original_list, &List.first/1) |> Enum.map(&String.to_integer/1)
    right = Enum.map(original_list, &List.last/1) |> Enum.map(&String.to_integer/1)
    Enum.zip(Enum.sort(left), Enum.sort(right))
  end
end
