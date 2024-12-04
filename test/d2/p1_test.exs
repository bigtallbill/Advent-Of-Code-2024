defmodule D2.P1Test do
  use ExUnit.Case
  doctest D2.P1

  test "run_test" do
    assert D2.P1.run_test() == 2
  end

  test "all_increasing?" do
    assert D2.P1.all_increasing?([1, 2, 3, 4, 5]) == true
    assert D2.P1.all_increasing?([1, 2, 3, 4, 5, 1]) == false
  end

  test "all_decreasing?" do
    assert D2.P1.all_decreasing?([5, 4, 3, 2, 1]) == true
    assert D2.P1.all_decreasing?([5, 4, 3, 2, 1, 2]) == false
  end

  test "adjacent_change_max" do
    assert D2.P1.adjacent_change_max([1, 2, 3, 4, 5]) == 1
    assert D2.P1.adjacent_change_max([1, 2, 3, 4, 5, 1]) == 4
  end

  test "is_valid?" do
    assert D2.P1.is_valid?([7, 6, 4, 2, 1]) == true
    assert D2.P1.is_valid?([1, 2, 7, 8, 9]) == false
    assert D2.P1.is_valid?([9, 7, 6, 2, 1]) == false
    assert D2.P1.is_valid?([1, 3, 2, 4, 5]) == false
    assert D2.P1.is_valid?([8, 6, 4, 4, 1]) == false
    assert D2.P1.is_valid?([1, 3, 6, 7, 9]) == true
  end
end
