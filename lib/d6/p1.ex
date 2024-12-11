defmodule D6.P1 do
  def run do
    input = File.read!("lib/d6/input.txt")
    run_with_input(input)
  end

  def run_test do
    input = File.read!("lib/d6/test_input.txt")
    run_with_input(input)
  end

  def run_with_input(input) do
    input
    |> String.split("\n", trim: true)
    # TODO: Implement day 6 specific logic here
  end

  def build_grid(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.with_index()
    |> Enum.map(fn {line, y} ->
      line
      |> String.graphemes()
      |> Enum.with_index()
      |> Enum.map(fn {char, x} -> {x, y, char} end)
    end)
  end
end
