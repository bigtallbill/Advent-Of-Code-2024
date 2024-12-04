defmodule D2.P1 do
  def run do
    input = File.read!("lib/d2/input.txt")
    run_with_input(input)
  end

  def run_test do
    input = File.read!("lib/d2/test_input.txt")
    run_with_input(input)
  end

  defp run_with_input(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&split_line/1)
    |> Enum.filter(&is_valid?/1)
    |> length()
  end

  def split_line(line) do
    line
    |> String.split(" ", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  def all_increasing?(list) do
    Enum.chunk_every(list, 2, 1, :discard)
    |> Enum.all?(fn [a, b] -> a < b end)
  end

  def all_decreasing?(list) do
    Enum.chunk_every(list, 2, 1, :discard)
    |> Enum.all?(fn [a, b] -> a > b end)
  end

  def adjacent_change_max(list) do
    Enum.chunk_every(list, 2, 1, :discard)
    |> Enum.map(fn [a, b] -> abs(b - a) end)
    |> Enum.max()
  end

  def is_valid?(list) do
    (all_increasing?(list) or all_decreasing?(list)) and adjacent_change_max(list) >= 1 and adjacent_change_max(list) <= 3
  end
end
