defmodule D4.P1 do
  def run do
    input = File.read!("lib/d4/input.txt")
    run_with_input(input)
  end

  def run_test do
    input = File.read!("lib/d4/test_input.txt")
    run_with_input(input)
  end

  def run_with_input(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.graphemes/1)
    |> IO.inspect()
  end
end
