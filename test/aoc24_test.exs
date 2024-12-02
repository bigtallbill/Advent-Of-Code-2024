defmodule Aoc24Test do
  use ExUnit.Case
  doctest Aoc24

  describe "solution runner" do
    test "run_day executes without error" do
      output = ExUnit.CaptureIO.capture_io(fn ->
        Aoc24.run_day(1, 1)
      end)
      assert output =~ "Day 1, Part 1"
      assert output =~ "Time: "
      # Time format could be any of our three formats
      assert Regex.match?(~r/Time: \d+(\.\d+)?(µs|ms|s)/, output)
    end

    test "run_all executes without error" do
      output = ExUnit.CaptureIO.capture_io(fn ->
        Aoc24.run_all()
      end)
      assert output =~ "🎄 Advent of Code 2024 Solutions 🎄"
      assert output =~ "Day 1, Part 1"
      assert output =~ "Time: "
      assert Regex.match?(~r/Time: \d+(\.\d+)?(µs|ms|s)/, output)
    end
  end
end
