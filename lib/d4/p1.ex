defmodule D4.P1 do
  def run do
    input = File.read!("lib/d4/input.txt")
    run_with_input(input)
  end

  def run_test do
    input = File.read!("lib/d4/test_input.txt")
    run_with_input(input)
  end

  def run_with_input(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.graphemes/1)
    |> to_grid_map()
    |> find_words()
  end

  def to_grid_map(input) do
    input
    |> Stream.with_index()
    |> Enum.reduce(%{}, fn {row, y}, acc ->
      Enum.with_index(row, fn char, x -> {{x, y}, char} end)
      |> Enum.into(acc)
    end)
  end

  def find_words(grid) do
    directions = [
      # right
      {1, 0},
      # down
      {0, 1},
      # left
      {-1, 0},
      # up
      {0, -1},
      # down right
      {1, 1},
      # up left
      {-1, -1},
      # down left
      {-1, 1},
      # up right
      {1, -1}
    ]

    (for {{x, y}, "X"} <- grid, direction <- directions, do: check_direction(grid, {x, y}, direction))
    |> Enum.count(& &1)
  end

  def check_direction(grid, {x, y}, {dx, dy}) do
    with m when m == "M" <- Map.get(grid, {x + dx, y + dy}),
         a when a == "A" <- Map.get(grid, {x + 2 * dx, y + 2 * dy}),
         s when s == "S" <- Map.get(grid, {x + 3 * dx, y + 3 * dy}) do
      true
    else
      _ -> false
    end
  end
end
