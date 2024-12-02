defmodule D1.P1 do
  def run do
    input = File.read!("lib/d1/input.txt")
    calculate_absolute_differences(input) |> Enum.sum()
  end

  def calculate_absolute_differences(input) do
    input
    |> parse_input_to_pairs()
    |> sort_and_zip_pairs()
    |> Stream.map(fn {l, r} -> abs(l - r) end)
  end

  def parse_input_to_pairs(input) do
    input
    |> String.split("\n", trim: true)
    |> Stream.map(&String.split(&1, ~r/\s+/, trim: true))
  end

  def sort_and_zip_pairs(original_list) do
    {left, right} =
      Stream.map(original_list, fn [l, r] -> {String.to_integer(l), String.to_integer(r)} end)
      |> Enum.unzip()

    Stream.zip(Enum.sort(left), Enum.sort(right))
  end
end
