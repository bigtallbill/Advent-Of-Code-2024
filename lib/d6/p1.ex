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
    grid = input
    |> String.split("\n", trim: true)
    |> Enum.with_index()
    |> Enum.reduce([], fn {line, y}, acc ->
      line
      |> String.graphemes()
      |> Enum.with_index()
      |> Enum.reduce(acc, fn {char, x}, acc ->
        [{x, y, char} | acc]
      end)
    end)

    {max_x, _, _} = Enum.max_by(grid, fn {x, _, _} -> x end, fn -> 0 end)
    {_, max_y, _} = Enum.max_by(grid, fn {_, y, _} -> y end, fn -> 0 end)

    start = get_start(grid)

    %{:size => {max_x, max_y}, :start => start, :matrix => grid}
  end

  def get_start(grid) do
    grid
    |> Enum.find(nil, fn {_, _, char} -> char == "^" end)
    |> case do
      nil -> raise "No start found"
      {x, y, _} -> {x, y}
    end
  end

  def simulate(grid) do
    matrix = grid.matrix

    matrix
  end
end
