defmodule Aoc24 do
  @moduledoc """
  Main module for running Advent of Code 2024 solutions.
  """

  @benchmark_iterations 100  # Number of times to run each solution for benchmarking

  @doc """
  Run all available solutions and display their results.
  """
  def run_all do
    IO.puts("\n🎄 Advent of Code 2024 Solutions 🎄\n")

    [
      {D1.P1, "Day 1, Part 1"},
      {D1.P2, "Day 1, Part 2"},
      {D2.P1, "Day 2, Part 1"},
      {D2.P2, "Day 2, Part 2"},
      {D3.P1, "Day 3, Part 1"},
      {D4.P1, "Day 4, Part 1"},
      {D5.P1, "Day 5, Part 1"},
      # Add new solutions here as they are implemented
    ]
    |> Enum.each(&run_solution/1)
  end

  @doc """
  Run a specific day's solution.
  """
  def run_day(day, part) do
    module = :"Elixir.D#{day}.P#{part}"
    run_solution({module, "Day #{day}, Part #{part}"})
  end

  defp run_solution({module, description}) do
    {time, result} = :timer.tc(fn -> module.run() end)
    IO.puts("#{description}: #{result}")
    IO.puts("Time: #{format_time(time)}\n")
  end

  defp format_time(microseconds) when microseconds < 1000,
    do: "#{microseconds}µs"

  defp format_time(microseconds) when microseconds < 1_000_000,
    do: "#{Float.round(microseconds / 1000, 2)}ms"

  defp format_time(microseconds),
    do: "#{Float.round(microseconds / 1_000_000, 2)}s"

  @doc """
  Run benchmarks for all available solutions and display their average results.
  """
  def benchmark_all do
    IO.puts("\n🎄 Advent of Code 2024 Benchmarks 🎄\n")

    [
      {D1.P1, "Day 1, Part 1"},
      {D1.P2, "Day 1, Part 2"},
      {D2.P1, "Day 2, Part 1"},
      {D2.P2, "Day 2, Part 2"},
      {D3.P1, "Day 3, Part 1"},
      {D4.P1, "Day 4, Part 1"},
      {D5.P1, "Day 5, Part 1"},
      # Add new solutions here as they are implemented
    ]
    |> Enum.each(&benchmark_solution/1)
  end

  defp benchmark_solution({module, description}) do
    # Get the result once first
    {_, result} = :timer.tc(fn -> module.run() end)
    IO.puts("#{description}: #{result}")

    # Then benchmark the runs
    times =
      Enum.map(1..@benchmark_iterations, fn _iteration ->
        {time, _result} = :timer.tc(fn -> module.run() end)
        time
      end)

    avg_time = Enum.sum(times) / @benchmark_iterations
    min_time = Enum.min(times)
    max_time = Enum.max(times)

    IO.puts("Average Time: #{format_time(avg_time)}")
    IO.puts("Min Time: #{format_time(min_time)}")
    IO.puts("Max Time: #{format_time(max_time)}\n")
  end
end
