defmodule D5.P2 do
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

  defp parse_input(input) do
    input
    |> String.trim()
    |> String.split("\n")
  end

  defp process(parsed_input) do
    # TODO: Implement solution
  end
end
