defmodule D3.P1Test do
  use ExUnit.Case
  doctest D3.P1

  test "run_with_input" do
    assert D3.P1.run_with_input(File.read!("lib/d3/test_input.txt")) == 161
  end
end
