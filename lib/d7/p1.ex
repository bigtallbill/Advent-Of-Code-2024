defmodule D7.P1 do
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
  end

  def parse_line(line) do
    [target, calibration] = String.split(line, ":", trim: true)
    %{
      :target => String.to_integer(target),
      :calibration => String.split(calibration, " ", trim: true) |> Enum.map(&String.to_integer/1)
    }
  end
end
