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
    |> tap(&IO.inspect/1)
  end

  def parse_line(line) do
    [target, calibration] = String.split(line, ":", trim: true)
    %{
      :target => String.to_integer(target),
      :calibration => String.split(calibration, " ", trim: true) |> Enum.map(&String.to_integer/1)
    }
  end

  def search(target, calibration) do
    generate_operation_combinations(calibration)
    |> tap(&IO.inspect/1)
    |> Enum.map(fn operation ->
      {result, _} = Code.eval_string(operation)
      {result, operation}
    end)
    |> tap(&IO.inspect/1)
    |> Enum.find(:not_found, fn {result, _} ->
      result == target
    end)
    |> tap(&IO.inspect/1)
  end


  @spec generate_combinations(any(), non_neg_integer()) :: any()
  def generate_combinations(symbols, spaces) do
    symbols
    |> List.duplicate(spaces)
    |> Enum.reduce([[]], fn symbols_for_position, acc ->
      for symbol <- symbols_for_position,
          combination <- acc,
          do: combination ++ [symbol]
    end)
  end

  def generate_operation_combinations(numbers) do
    spaces = length(numbers) - 1  # You need one less operator than numbers

    generate_combinations(@symbols, spaces)
    |> Enum.map(fn operators ->
      numbers
      |> Enum.zip(operators ++ [""])  # Add empty operator for last number
      |> Enum.map_join(" ", fn {num, op} -> "(#{num} #{op})" end)
      |> (&("a = " <> &1)).()
    end)
  end
end
