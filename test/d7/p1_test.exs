defmodule D7.P1Test do
  use ExUnit.Case

  test "run_test" do
    assert D7.P1.run_test() == 0  # Update this with the expected test result
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
      %{:target => 190, :calibration => [10, 19]},
      %{:target => 3267, :calibration => [81, 40, 27]},
      %{:target => 83, :calibration => [17, 5]},
      %{:target => 156, :calibration => [15, 6]},
      %{:target => 7290, :calibration => [6, 8, 6, 15]},
      %{:target => 161011, :calibration => [16, 10, 13]},
      %{:target => 192, :calibration => [17, 8, 14]},
      %{:target => 21037, :calibration => [9, 7, 18, 13]},
      %{:target => 292, :calibration => [11, 6, 16, 20]}
    ]
  end
end
