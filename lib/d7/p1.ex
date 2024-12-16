defmodule D7.P1 do
  @symbols ["+", "*"]

  def run do
    input = File.read!("lib/d7/input.txt")
    run_with_input(input)
  end

  def run_test do
    input = File.read!("lib/d7/test_input.txt")
    run_with_input(input)
  end

  def run_with_input(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line/1)
    |> Enum.map(fn %{target: target, calibration: calibration} ->
      search(target, calibration)
    end)
    |> Enum.filter(fn result -> result != :not_found end)
    |> Enum.map(fn {result, _} -> result end)
    |> Enum.sum()
  end

  def parse_line(line) do
    [target, calibration] = String.split(line, ":", trim: true)
    %{
      :target => String.to_integer(target),
      :calibration => String.split(calibration, " ", trim: true) |> Enum.map(&String.to_integer/1)
    }
  end

  def search(target, numbers) do
    spaces = length(numbers) - 1

    result = generate_combinations(@symbols, spaces)
    |> Enum.find_value(fn operators ->
      result = evaluate_left_to_right(numbers, operators)
      if result == target do
        expression = numbers
        |> Enum.zip(operators ++ [""])
        |> Enum.map_join(" ", fn {num, op} -> "#{num} #{op}" end)
        {target, "a = #{expression}"}
      end
    end)

    result || :not_found
  end

  def generate_combinations(symbols, spaces) do
    symbols
    |> List.duplicate(spaces)
    |> Enum.reduce([[]], fn symbols_for_position, acc ->
      for symbol <- symbols_for_position,
          combination <- acc,
          do: combination ++ [symbol]
    end)
  end

  def evaluate_left_to_right(numbers, operators) do
    [first | rest] = numbers
    operators
    |> Enum.zip(rest)
    |> Enum.reduce(first, fn {op, num}, acc ->
      case op do
        "+" -> acc + num
        "*" -> acc * num
      end
    end)
  end
end
