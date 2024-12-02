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
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split(&1, ~r/\s+/, trim: true))
  end

  def split_lists(original_list) do
    {left, right} =
      Enum.map(original_list, fn [l, r] -> {String.to_integer(l), String.to_integer(r)} end)
      |> Enum.unzip()

    Enum.zip(Enum.sort(left), Enum.sort(right))
  end
end
