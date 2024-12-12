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
    |> build_grid()
    |> simulate()
    |> Enum.uniq()
    |> Enum.count()
  end

  def build_grid(input) do
    grid = input
    |> String.split("\n", trim: true)
    |> Enum.with_index()
    |> Enum.reduce(%{}, fn {line, y}, acc ->
      line
      |> String.graphemes()
      |> Enum.with_index()
      |> Enum.reduce(acc, fn {char, x}, acc ->
        Map.put(acc, {x, y}, char)
      end)
    end)

    {{max_x, _}, _} = Enum.max_by(grid, fn {{x, _}, _} -> x end, fn -> 0 end)
    {{_, max_y}, _} = Enum.max_by(grid, fn {{_, y}, _} -> y end, fn -> 0 end)

    start = get_start(grid)

    %{:size => {max_x, max_y}, :start => start, :matrix => grid}
  end

  def get_start(grid) do
    grid
    |> Enum.find(nil, fn {{_, _}, char} -> char == "^" end)
    |> case do
      nil -> raise "No start found"
      {{x, y}, _} -> {x, y}
    end
  end

  @doc """
  Simulate the grid.
  From the start position, move forward (always starting with up) until you hit a blockage. Then turn 90 degrees clockwise.
  Repeat until you hit the edge of the grid. Keep track of the positions you pass through.
  """
  def simulate(grid) do
    matrix = grid.matrix
    start = grid.start
    size = grid.size

    simulate_step(matrix, start, size, :up, [start])
    |> Enum.reverse()
  end

  @doc """
  Simulates a single step in the grid. Recursively calls itself until it hits a blockage or the edge of the grid.
  """
  def simulate_step(matrix, position, size, direction, visited) do
    new_position = move_forward(position, direction)

    {newX, newY} = new_position
    {maxX, maxY} = size

    if newX < 0 or newX > maxX or newY < 0 or newY > maxY do
      visited
    else
      if is_blockage?(matrix, new_position) do
        case direction do
          :up -> simulate_step(matrix, position, size, :right, visited)
          :right -> simulate_step(matrix, position, size, :down, visited)
          :down -> simulate_step(matrix, position, size, :left, visited)
          :left -> simulate_step(matrix, position, size, :up, visited)
        end
      else
        simulate_step(matrix, new_position, size, direction, [new_position | visited])
      end
    end
  end

  @doc """
  Moves the position forward in the given direction.
  """
  def move_forward({x, y}, direction) do
    case direction do
      :up -> {x, y - 1}
      :right -> {x + 1, y}
      :down -> {x, y + 1}
      :left -> {x - 1, y}
    end
  end

  @doc """
  Check if a position is a blockage.
  A blockage is defined by the # character.
  """
  def is_blockage?(matrix, {x, y}) do
    matrix
    |> Map.get({x, y}, nil)
    |> case do
      nil -> false
      char -> char == "#"
    end
  end
end
