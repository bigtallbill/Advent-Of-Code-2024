defmodule D2.P2Test do
  use ExUnit.Case
  doctest D2.P2

  test "run_test" do
    assert D2.P2.run_test() == 4
  end

  test "run" do
    # apparently 410 is too low
    assert D2.P2.run() > 410
  end

  test "dampen_list" do
    assert D2.P2.dampen_list([1, 2, 3, 4, 5]) == {:increasing, 0, [1, 2, 3, 4, 5], [1, 2, 3, 4, 5]}
    assert D2.P2.dampen_list([1, 2, 3, 4, 5, 1]) == {:increasing, 1, [1, 2, 3, 4, 5], [1, 2, 3, 4, 5, 1]}
    assert D2.P2.dampen_list([1, 2, 3, 4, 5, 1, 6, 7]) == {:increasing, 1, [1, 2, 3, 4, 5, 6, 7], [1, 2, 3, 4, 5, 1, 6, 7]}
    assert D2.P2.dampen_list([1, 2, 3, 1, 2]) == {:bad_direction, 2, [1, 2, 3], [1, 2, 3, 1, 2]}
    assert D2.P2.dampen_list([1, 2, 3, 4, 10]) == {:increasing, 1, [1, 2, 3, 4], [1, 2, 3, 4, 10]}
    assert D2.P2.dampen_list([1, 2, 3, 4, 10, 20]) == {:bad_magnitude, 2, [1, 2, 3, 4], [1, 2, 3, 4, 10, 20]}
    assert D2.P2.dampen_list([1, 2, 2, 2, 2]) == {:bad_magnitude, 2, [1, 2], [1, 2, 2, 2, 2]}
  end

  test "dampen_list with real input example" do
    #assert D2.P2.dampen_list([24, 26, 27, 30, 33, 33, 34, 38]) == {:bad_magnitude, 2, [24, 26, 27, 30, 33, 34]}
    # assert D2.P2.dampen_list([85, 85, 86, 84, 82]) == {:bad_direction, 2, [85, 86]}
    #assert D2.P2.dampen_list([59, 59, 61, 63, 66, 68, 68, 66]) == {:bad_magnitude, 2, [59, 61, 63, 66, 68]}
    #assert D2.P2.dampen_list([70, 70, 71, 75, 78, 81, 82]) == {:bad_magnitude, 2, [70, 71]}
    #assert D2.P2.dampen_list([4, 4, 8, 11, 18]) == {:bad_magnitude, 2, []}
    #assert D2.P2.dampen_list([74, 73, 72, 70, 68, 66, 63, 66]) == {:decreasing, 1, [74, 73, 72, 70, 68, 66, 63]}
    #assert D2.P2.dampen_list([27, 30, 31, 33, 34, 35, 36, 39]) == {:increasing, 0, [27, 30, 31, 33, 34, 35, 36, 39]}
    #assert D2.P2.dampen_list([24, 23, 20, 17, 14, 11, 10]) == {:decreasing, 0, [24, 23, 20, 17, 14, 11, 10]}
    #assert D2.P2.dampen_list([11, 9, 6, 5, 4, 3]) == {:decreasing, 0, [11, 9, 6, 5, 4, 3]}
    #assert D2.P2.dampen_list([28, 29, 32, 35, 38, 40, 43, 46]) == {:increasing, 0, [28, 29, 32, 35, 38, 40, 43, 46]}
    #assert D2.P2.dampen_list([25, 27, 28, 31, 32, 35, 36, 39]) == {:increasing, 0, [25, 27, 28, 31, 32, 35, 36, 39]}
    #assert D2.P2.dampen_list([83, 84, 87, 90, 91, 94, 96, 98]) == {:increasing, 0, [83, 84, 87, 90, 91, 94, 96, 98]}
    #assert D2.P2.dampen_list([8, 12, 13, 14, 15, 16, 16, 20]) == {:bad_magnitude, 2, []}
    # assert D2.P2.dampen_list([11, 11, 8, 7, 4, 1]) == {:decreasing, 1, [11, 8, 7, 4, 1]}
    #assert D2.P2.dampen_list([85, 81, 84, 81, 79, 76, 76]) == {:bad_magnitude, 2, [85, 84, 81, 79, 76]}

  end
end
