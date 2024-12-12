defmodule D6.P1Test do
  use ExUnit.Case

  test "run_test" do
    assert D6.P1.run_test() == 41
  end

  test "build_grid" do
    input = """
    #..
    ..#
    ^#.
    """
    assert D6.P1.build_grid(input) == %{:size => {2, 2}, :start => {0, 2}, :matrix => %{
        {2, 2} => ".",
        {1, 2} => "#",
        {0, 2} => "^",
        {2, 1} => "#",
        {1, 1} => ".",
        {0, 1} => ".",
        {2, 0} => ".",
        {1, 0} => ".",
        {0, 0} => "#"
      }
    }
  end

  test "simulate" do
    assert """
    #..
    ..#
    ^..
    """
    |> D6.P1.build_grid()
    |> D6.P1.simulate() == [{0, 2}, {0, 1}, {1, 1}, {1, 2}]
  end

  test "is_blockage?" do
    assert D6.P1.is_blockage?(%{
      {0, 0} => "#",
      {1, 0} => ".",
      {2, 0} => "."
    }, {1, 0}) == false

    assert D6.P1.is_blockage?(%{
      {0, 0} => "#",
      {1, 0} => ".",
      {2, 0} => "."
    }, {0, 0}) == true
  end
end
