defmodule D3.P1 do
  def run do
    input = File.read!("lib/d3/input.txt")
    run_with_input(input)
  end

  def run_with_input(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      Regex.scan(~r/mul\((\d+),(\d+)\)/, line)
      |> Enum.map(fn [_full, n1, n2] -> {String.to_integer(n1), String.to_integer(n2)} end)
      |> Enum.map(fn {n1, n2} -> n1 * n2 end)
      |> Enum.sum()
    end)
    |> Enum.sum()
  end
end
