defmodule D2.P2Test do
  use ExUnit.Case
  doctest D2.P2

  test "run_test" do
    assert D2.P2.run_test() == 4
  end

  test "run" do
    assert D2.P2.run() == 1705
  end

  test "dampen_list" do
    assert D2.P2.dampen_list([1, 2, 3, 4, 5]) == {:increasing, 0, [1, 2, 3, 4, 5]}
    assert D2.P2.dampen_list([1, 2, 3, 4, 5, 1]) == {:increasing, 1, [1, 2, 3, 4, 5]}
    assert D2.P2.dampen_list([1, 2, 3, 4, 5, 1, 6, 7]) == {:increasing, 1, [1, 2, 3, 4, 5, 6, 7]}
    assert D2.P2.dampen_list([1, 2, 3, 1, 2]) == {:bad_direction, 2, [1, 2, 3]}
    assert D2.P2.dampen_list([1, 2, 3, 4, 10]) == {:increasing, 1, [1, 2, 3, 4]}
    assert D2.P2.dampen_list([1, 2, 3, 4, 10, 20]) == {:bad_magnitude, 2, [1, 2, 3, 4]}
    assert D2.P2.dampen_list([1, 2, 2, 2, 2]) == {:bad_magnitude, 2, [1, 2]}
  end

  test "dampen_list with real input example" do
    #assert D2.P2.dampen_list([24, 26, 27, 30, 33, 33, 34, 38]) == {:bad_magnitude, 2, [24, 26, 27, 30, 33, 34]}
    # assert D2.P2.dampen_list([85, 85, 86, 84, 82]) == {:bad_direction, 2, [85, 86]}
    #assert D2.P2.dampen_list([59, 59, 61, 63, 66, 68, 68, 66]) == {:bad_magnitude, 2, [59, 61, 63, 66, 68]}
    #assert D2.P2.dampen_list([70, 70, 71, 75, 78, 81, 82]) == {:bad_magnitude, 2, [70, 71]}
    #assert D2.P2.dampen_list([4, 4, 8, 11, 18]) == {:bad_magnitude, 2, []}
    assert D2.P2.dampen_list([74, 73, 72, 70, 68, 66, 63, 66]) == {:decreasing, 1, [74, 73, 72, 70, 68, 66, 63]}
  end
end
