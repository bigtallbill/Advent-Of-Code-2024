defmodule D1.P2Test do
  use ExUnit.Case
  doctest D1.P2

  test "parse_input_to_pairs splits input string into list of pairs" do
    input = "123   456\n234   567\n"
    expected = [["123", "456"], ["234", "567"]]
    assert D1.P2.parse_input_to_pairs(input) |> Enum.to_list() == expected
  end

  test "split_into_left_and_right splits pairs into two lists" do
    original_list = [["123", "456"], ["789", "012"]]
    expected = {[123, 789], [456, 012]}
    assert D1.P2.split_into_left_and_right(original_list) == expected
  end

  test "count_occurences counts occurences of each number in both lists" do
    original_list = {[1, 2, 3, 4], [1, 1, 2, 3, 3]}
    expected = [{1, 2}, {2, 1}, {3, 2}, {4, 0}]
    assert D1.P2.count_occurences_of_left_in_right(original_list) == expected
  end

  test "multiply_by_occurences multiplies each number by its count and sums the results" do
    original_list = [{1, 2}, {2, 1}, {3, 2}, {4, 0}]
    expected = [2, 2, 6, 0]
    assert D1.P2.multiply_by_occurences(original_list) == expected
  end
end
