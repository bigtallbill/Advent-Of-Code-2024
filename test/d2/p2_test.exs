defmodule D2.P2Test do
  use ExUnit.Case
  doctest D2.P2

  test "run_test" do
    assert D2.P2.run_test() == 4
  end

  test "all_increasing?" do
    assert D2.P2.all_increasing?([1, 2, 3, 4, 5]) == true
    assert D2.P2.all_increasing?([1, 2, 3, 4, 5, 1]) == false
  end

  test "all_decreasing?" do
    assert D2.P2.all_decreasing?([5, 4, 3, 2, 1]) == true
    assert D2.P2.all_decreasing?([5, 4, 3, 2, 1, 2]) == false
  end

  test "adjacent_change_max" do
    assert D2.P2.adjacent_change_max([1, 2, 3, 4, 5]) == 1
    assert D2.P2.adjacent_change_max([1, 2, 3, 4, 5, 1]) == 4
  end

  test "is_valid?" do
    assert D2.P2.is_valid?([7, 6, 4, 2, 1]) == true
    assert D2.P2.is_valid?([1, 2, 7, 8, 9]) == true
    assert D2.P2.is_valid?([9, 7, 6, 2, 1]) == true
    assert D2.P2.is_valid?([1, 3, 2, 4, 5]) == true
    assert D2.P2.is_valid?([8, 6, 4, 4, 1]) == true
    assert D2.P2.is_valid?([1, 3, 6, 7, 9]) == true
    assert D2.P2.is_valid?([1, 10, 1, 10]) == false
    assert D2.P2.is_valid?([1, 10, 2, 3]) == true
  end

  test "count_unsafe_changes" do
    # assert D2.P2.count_unsafe_changes([1, 2, 3, 4, 5]) == 0
    # assert D2.P2.count_unsafe_changes([1, 2, 3, 4, 5, 1]) == 1
    # assert D2.P2.count_unsafe_changes([1, 2, 3, 4, 5, 1, 5]) == 2
    # assert D2.P2.count_unsafe_changes([1, 2, 10, 1, 2]) == 2

    # Test cases from problem description
    assert D2.P2.count_unsafe_changes([7, 6, 4, 2, 1]) == 0  # Safe without removing any level
    assert D2.P2.count_unsafe_changes([1, 2, 7, 8, 9]) == 1  # Unsafe regardless of which level is removed
    assert D2.P2.count_unsafe_changes([9, 7, 6, 2, 1]) == 1  # Unsafe regardless of which level is removed
    assert D2.P2.count_unsafe_changes([1, 3, 2, 4, 5]) == 0  # Safe by removing the second level, 3
    assert D2.P2.count_unsafe_changes([8, 6, 4, 4, 1]) == 1  # Safe by removing the third level, 4
    assert D2.P2.count_unsafe_changes([1, 3, 6, 7, 9]) == 0  # Safe without removing any level
  end

  test "dampen_list" do
    assert D2.P2.dampen_list([1, 2, 3, 4, 5]) == {:increasing, 0, [1, 2, 3, 4, 5]}
    assert D2.P2.dampen_list([1, 2, 3, 4, 5, 1]) == {:increasing, 1, [1, 2, 3, 4, 5]}
  end
end
