defmodule D4.P1Test do
  use ExUnit.Case

  test "run_test" do
    assert D4.P1.run_test() == 18
  end

  test "run_with_input" do
    input = """
    MMMSXXMASM
    MSAMXMSMSA
    """
    assert D4.P1.run_with_input(input) == 2
  end

  test "to_grid_map" do
    input = [
      ["M", "M", "M", "S", "X", "X", "M", "A", "S", "M"],
      ["M", "S", "A", "M", "X", "M", "S", "M", "S", "A"]
    ]

    assert D4.P1.to_grid_map(input) == %{
      {0, 0} => "M", {1, 0} => "M", {2, 0} => "M", {3, 0} => "S", {4, 0} => "X",
      {5, 0} => "X", {6, 0} => "M", {7, 0} => "A", {8, 0} => "S", {9, 0} => "M",
      {0, 1} => "M", {1, 1} => "S", {2, 1} => "A", {3, 1} => "M", {4, 1} => "X",
      {5, 1} => "M", {6, 1} => "S", {7, 1} => "M", {8, 1} => "S", {9, 1} => "A"
    }
  end

  test "check_direction" do
    grid = %{
      {0, 0} => "M", {1, 0} => "M", {2, 0} => "M", {3, 0} => "S", {4, 0} => "X",
      {5, 0} => "X", {6, 0} => "M", {7, 0} => "A", {8, 0} => "S", {9, 0} => "M",
      {0, 1} => "M", {1, 1} => "S", {2, 1} => "A", {3, 1} => "M", {4, 1} => "X",
      {5, 1} => "M", {6, 1} => "S", {7, 1} => "M", {8, 1} => "S", {9, 1} => "A"
    }

    assert D4.P1.check_direction(grid, {5, 0}, {1, 0}) == true
    assert D4.P1.check_direction(grid, {4, 1}, {-1, 0}) == true
    assert D4.P1.check_direction(grid, {0, 0}, {1, 0}) == false
  end

  test "find_words" do
    grid = %{
      {0, 0} => "M", {1, 0} => "M", {2, 0} => "M", {3, 0} => "S", {4, 0} => "X",
      {5, 0} => "X", {6, 0} => "M", {7, 0} => "A", {8, 0} => "S", {9, 0} => "M",
      {0, 1} => "M", {1, 1} => "S", {2, 1} => "A", {3, 1} => "M", {4, 1} => "X",
      {5, 1} => "M", {6, 1} => "S", {7, 1} => "M", {8, 1} => "S", {9, 1} => "A"
    }
    assert D4.P1.find_words(grid) == 2
  end
end
