defmodule D5.P1 do
  def run do
    input = File.read!("lib/d5/input.txt")
    run_with_input(input)
  end

  def run_test do
    input = File.read!("lib/d5/test_input.txt")
    run_with_input(input)
  end

  def run_with_input(input) do
    input
    |> parse_input()
    |> process()
  end

  def parse_input(input) do
    input
    |> String.trim()
    |> String.split("\n\n") # split the 2 sections: rules and updates
    |> fn [rules, updates] ->
      %{
        :rules => rules |> String.split("\n") |> Enum.map(&parse_rule/1),
        :updates => updates |> String.split("\n") |> Enum.map(&parse_update/1)
      }
    end.()
  end

  def count_invalid_updates(%{rules: rules, updates: updates}) do
    updates
    |> Enum.filter(&is_valid_update?(&1, rules))
    |> length()
  end

  @doc """
  Given an update and a list of rules, return the rules that are applicable to the update.
  A rule is applicable if both of its values are in the update.
  """
  def get_rules_for_update(update, rules) do
    Enum.filter(rules, fn {a, b} -> Enum.member?(update, a) and Enum.member?(update, b) end)
  end

  def is_valid_update?(update, rules) do
    rules_for_update = get_rules_for_update(update, rules)
    rule_map = Enum.reduce(rules_for_update, %{}, fn {a, b}, acc -> Map.put(acc, a, b) end)

    original_update = update

    sorted_by_rules = Enum.sort(update, fn a, b -> rule_map[a] > rule_map[b] end)

    sorted_by_rules == original_update
  end

  def parse_rule(rule) do
    rule
    |> String.split("|", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> List.to_tuple()
  end

  def parse_update(update) do
    update
    |> String.split(",", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  def process(parsed_input) do
    # TODO: Implement solution
  end
end
