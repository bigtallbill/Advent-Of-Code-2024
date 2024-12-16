defmodule D7.P1Test do
  use ExUnit.Case

  test "run_test" do
    assert D7.P1.run_test() == 3749
  end

  test "run_with_input" do
    input = """
    190: 10 19
    3267: 81 40 27
    83: 17 5
    156: 15 6
    7290: 6 8 6 15
    161011: 16 10 13
    192: 17 8 14
    21037: 9 7 18 13
    292: 11 6 16 20
    """
    assert D7.P1.run_with_input(input) == [
      {190, "a = 10 * 19 "},
      {3267, "a = 81 * 40 + 27 "},
      :not_found,
      :not_found,
      :not_found,
      :not_found,
      :not_found,
      :not_found,
      {292, "a = 11 + 6 * 16 + 20 "}
    ]
  end

  test "parse_line" do
    assert D7.P1.parse_line("190: 10 19") == %{:target => 190, :calibration => [10, 19]}
  end

  test "generate_combinations" do
    assert D7.P1.generate_combinations(["+", "-", "*"], 2) == [
      ["+", "+"],
      ["-", "+"],
      ["*", "+"],
      ["+", "-"],
      ["-", "-"],
      ["*", "-"],
      ["+", "*"],
      ["-", "*"],
      ["*", "*"]
    ]
  end

  test "search" do
    assert D7.P1.search(195, [10, 19, 5]) == {195, "a = 10 * 19 + 5 "}
    assert D7.P1.search(197, [10, 19, 5]) == :not_found
    assert D7.P1.search(292, [11, 6, 16, 20]) == {292, "a = 11 + 6 * 16 + 20 "}
  end
end
