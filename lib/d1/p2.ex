defmodule D1.P2 do
  def run do
    input = File.read!("lib/d1/input.txt")
    parse_input_to_pairs(input)
    |> split_into_left_and_right()
    |> count_occurences_of_left_in_right()
    |> multiply_by_occurences()
    |> Enum.sum()
  end

  def parse_input_to_pairs(input) do
    input
    |> String.split("\n", trim: true)
    |> Stream.map(&String.split(&1, ~r/\s+/, trim: true))
  end

  def split_into_left_and_right(pairs) do
    Stream.map(pairs, fn [l, r] -> {String.to_integer(l), String.to_integer(r)} end)
    |> Enum.unzip()
  end

  def count_occurences_of_left_in_right({left, right}) do
    freqs = Enum.frequencies(right)
    Enum.map(left, fn num ->
      {num, Map.get(freqs, num, 0)}
    end)
  end

  def multiply_by_occurences(occurences) do
    Enum.map(occurences, fn {num, count} -> num * count end)
  end
end
