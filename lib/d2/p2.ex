defmodule D2.P2 do
  def run do
    input = File.read!("lib/d2/input.txt")
    run_with_input(input)
  end

  def run_test do
    input = File.read!("lib/d2/test_input2.txt")
    run_with_input(input)
  end

  defp run_with_input(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&split_line/1)
    |> Enum.filter(&is_valid?/1)
    |> length()
  end

  def split_line(line) do
    line
    |> String.split(" ", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  def dampen_list(list) do
    dampen_list(list, :unknown, 0, [])
  end

  def dampen_list([], direction, count, acc) do
    {direction, count, acc}
  end

  def dampen_list([_], direction, count, acc) do
    {direction, count, acc}
  end

  def dampen_list([first, second | tail], current_dir, count, acc) do
    new_dir =
      cond do
        second > first -> :increasing
        second < first -> :decreasing
        true -> current_dir
      end

    bad_change = new_dir != current_dir and current_dir != :unknown

    if bad_change do
      if count > 0 do
        :unsafe
      end
      dampen_list([second | tail], new_dir, count + 1, [second | acc])
    else
      dampen_list([second | tail], new_dir, count, [second | acc])
    end
  end

  def dampen_list([head | tail], direction, count, acc) do
    dampen_list(tail, direction, count, [head | acc])
  end

  def all_increasing?(list) do
    Enum.chunk_every(list, 2, 1, :discard)
    |> Enum.all?(fn [a, b] -> a < b end)
  end

  def all_decreasing?(list) do
    Enum.chunk_every(list, 2, 1, :discard)
    |> Enum.all?(fn [a, b] -> a > b end)
  end

  def adjacent_change_max(list) do
    Enum.chunk_every(list, 2, 1, :discard)
    |> Enum.map(fn [a, b] -> abs(b - a) end)
    |> Enum.max()
  end

  def count_unsafe_changes(list) do
    Enum.chunk_every(list, 2, 1, :discard)
    |> Enum.map(fn [a, b] -> abs(b - a) end)
    |> Enum.filter(fn diff ->
      not (diff >= 1 and diff <= 3)
    end)
    |> IO.inspect()
    |> length()
  end

  def is_valid?(list) do
    safe = (all_increasing?(list) or all_decreasing?(list))
    cond do
      not safe and count_unsafe_changes(list) <= 1 -> true
      safe -> safe
      true -> false # default case
    end
  end
end
