defmodule D5.P1Test do
  use ExUnit.Case
  doctest D5.P1

  test "run_test returns expected result" do
    assert D5.P1.run_test() == 143
  end

  test "parse_input returns expected result" do
    assert D5.P1.parse_input(File.read!("lib/d5/test_input.txt")) == %{
             :rules => [
               {47, 53},
               {97, 13},
               {97, 61},
               {97, 47},
               {75, 29},
               {61, 13},
               {75, 53},
               {29, 13},
               {97, 29},
               {53, 29},
               {61, 53},
               {97, 53},
               {61, 29},
               {47, 13},
               {75, 47},
               {97, 75},
               {47, 61},
               {75, 61},
               {47, 29},
               {75, 13},
               {53, 13}
             ],
             :updates => [
               [75, 47, 61, 53, 29],
               [97, 61, 53, 29, 13],
               [75, 29, 13],
               [75, 97, 47, 61, 53],
               [61, 13, 29],
               [97, 13, 75, 29, 47]
             ]
           }
  end

  test "get_rules_for_update returns expected result" do
    assert D5.P1.get_rules_for_update(
             [97, 61, 88],
             [
               {47, 53},
               {97, 13},
               {97, 61}
             ]
           ) == [
             {97, 61}
           ]
  end

  test "is_valid_update? returns expected result" do
    # assert D5.P1.is_valid_update?([97, 61, 88], [
    #          {47, 53},
    #          {97, 13},
    #          {97, 61}
    #        ]) == false

    assert D5.P1.is_valid_update?([97, 61, 88], [
             {97, 61}
           ]) == true
  end
end
