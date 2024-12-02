defmodule D1p1.P1 do
  def run do
    input = File.read!("lib/d1p1/input.txt")
    IO.inspect(calculate_absolute_differences(input) |> Enum.sum())
  end

  def calculate_absolute_differences(input) do
    input
    |> parse_input_to_pairs()
    |> sort_and_zip_pairs()
    |> Enum.map(fn {l, r} -> abs(l - r) end)
  end

  def parse_input_to_pairs(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split(&1, ~r/\s+/, trim: true))
  end

  def sort_and_zip_pairs(original_list) do
    {left, right} =
      Enum.map(original_list, fn [l, r] -> {String.to_integer(l), String.to_integer(r)} end)
      |> Enum.unzip()

    Enum.zip(Enum.sort(left), Enum.sort(right))
  end
end
