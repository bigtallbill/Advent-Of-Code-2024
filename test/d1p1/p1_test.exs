defmodule D1p1.P1Test do
  use ExUnit.Case
  doctest D1p1.P1

  test "parse_input splits input string into list of integers" do
    input = "123   456\n234   567\n"
    expected = [["123", "456"], ["234", "567"]]
    assert D1p1.P1.parse_input(input) == expected
  end

  test "split_lists splits a list into two lists" do
    original_list = [["123", "456"], ["789", "012"]]
    expected = [{123, 12}, {789, 456}]
    assert D1p1.P1.split_lists(original_list) == expected
  end

  test "calc_distances calculates the distances between two lists" do
    input = "5   10\n10   15\n10   5"
    expected = [0, 0, 5]
    assert D1p1.P1.calc_distances(input) == expected
  end
end
