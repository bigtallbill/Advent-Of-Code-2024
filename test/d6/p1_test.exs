defmodule D6.P1Test do
  use ExUnit.Case

  test "run_test" do
    assert D6.P1.run_test() == 0  # Update this with the expected result
  end

  test "run_with_input" do
    input = """
    # Add your test input here
    """
    assert D6.P1.run_with_input(input) == 0  # Update this with the expected result
  end

  test "build_grid" do
    input = File.read!("lib/d6/test_input.txt")
    assert D6.P1.build_grid(input) == []
  end
end
