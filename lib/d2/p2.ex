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
    |> Enum.map(&dampen_list/1)
    |> tap(fn x ->
      Enum.filter(x, fn {state, _, _, _} -> state == :bad_direction or state == :bad_magnitude end)
      |> Enum.map(&IO.inspect(&1, charlists: :as_lists))
    end)
    |> tap(&IO.inspect(length(&1)))
    |> Enum.filter(fn {state, _, _, _} -> state != :bad_direction and state != :bad_magnitude end)
    |> length()
  end

  def split_line(line) do
    line
    |> String.split(" ", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  def dampen_list(list) do
    dampen_list(list, :unknown, 0, [], list)
  end

  def dampen_list([], direction, count, acc, original_list) do
    {direction, count, acc, original_list}
  end

  def dampen_list([_], direction, count, acc, original_list) do
    {direction, count, Enum.reverse(acc), original_list}
  end

  def dampen_list([first, second | tail], current_dir, count, acc, original_list) do
    new_dir =
      cond do
        second > first -> :increasing
        second < first -> :decreasing
        true -> current_dir
      end

    magnitude_change = abs(second - first)

    bad_direction_change = new_dir != current_dir and current_dir != :unknown
    bad_magnitude_change = magnitude_change < 1 or magnitude_change > 3

    bad_change = bad_direction_change or bad_magnitude_change

    if bad_change do
      if count > 0 do
        # if we can't survive the first bad change,
        # then just return the acc, and reverse it to get the correct order
        error = cond do
          bad_direction_change -> :bad_direction
          bad_magnitude_change -> :bad_magnitude
        end

        {error, count + 1, Enum.reverse(acc), original_list}
      else
        # if we can survive the first change,
        # then return the acc without adding the element that caused the change
        dampen_list([first | tail], current_dir, count + 1, acc, original_list)
      end
    else
      if length(acc) == 0 do
        # add the first 2 elements to the acc if we have no elements yet
        # we need to do this because we'll loose the first element otherwise
        dampen_list([second | tail], new_dir, count, [second, first], original_list)
      else
        # add the next element to the acc
        dampen_list([second | tail], new_dir, count, [second | acc], original_list)
      end
    end
  end

  def dampen_list([head | tail], direction, count, acc, original_list) do
    dampen_list(tail, direction, count, [head | acc], original_list)
  end
end
