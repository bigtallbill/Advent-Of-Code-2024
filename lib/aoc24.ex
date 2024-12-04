defmodule Aoc24 do
  @moduledoc """
  Main module for running Advent of Code 2024 solutions.
  """

  @doc """
  Run all available solutions and display their results.
  """
  def run_all do
    IO.puts("\n🎄 Advent of Code 2024 Solutions 🎄\n")

    [
      {D1.P1, "Day 1, Part 1"},
      {D1.P2, "Day 1, Part 2"},
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
end
