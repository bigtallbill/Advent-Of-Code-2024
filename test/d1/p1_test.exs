defmodule D1.P1Test do
  use ExUnit.Case
  doctest D1.P1

  test "parse_input_to_pairs splits input string into list of pairs" do
    input = "123   456\n234   567\n"
    expected = [["123", "456"], ["234", "567"]]
    assert D1.P1.parse_input_to_pairs(input) == expected
  end

  test "sort_and_zip_pairs sorts and zips two lists" do
    original_list = [["123", "456"], ["789", "012"]]
    expected = [{123, 12}, {789, 456}]
    assert D1.P1.sort_and_zip_pairs(original_list) == expected
  end

  test "calculate_absolute_differences calculates the absolute differences between two lists" do
    input = "5   10\n10   15\n10   5"
    expected = [0, 0, 5]
    assert D1.P1.calculate_absolute_differences(input) == expected
  end
end
