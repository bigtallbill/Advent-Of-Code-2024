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
    |> correctly_ordered_updates()
    |> get_middle_numbers()
    |> Enum.sum()
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

  def correctly_ordered_updates(%{rules: rules, updates: updates}) do
    updates
    |> Enum.filter(&is_valid_update?(&1, rules))
  end

  def is_valid_update?(update, rules) do
    rules_for_update = get_rules_for_update(update, rules)

    Enum.reduce_while(rules_for_update, true, fn {rule_subject, must_be_before}, _ ->
      result = Enum.reduce_while(update, true, fn num, _ ->
        cond do
          num == rule_subject ->
            {:halt, true}
          num == must_be_before ->
            {:halt, false}
          true ->
            {:cont, true}
        end
      end)

      case result do
        true -> {:cont, true}
        false -> {:halt, false}
      end
    end)
  end

  def get_middle_numbers(updates) do
    updates
    |> Enum.map(fn update ->
      length = length(update)
      middle_index = div(length, 2)
      Enum.at(update, middle_index)
    end)
  end

  @doc """
  Given an update and a list of rules, return the rules that are applicable to the update.
  A rule is applicable if both of its values are in the update.
  """
  def get_rules_for_update(update, rules) do
    Enum.filter(rules, fn {a, b} -> Enum.member?(update, a) and Enum.member?(update, b) end)
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
end
