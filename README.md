# Advent of Code 2024 Solutions

This repository contains my solutions for [Advent of Code 2024](https://adventofcode.com/2024) implemented in Elixir.

## Project Structure

Solutions are organized by day and part in the `lib` directory:
- `d1/p1.ex` - Day 1, Part 1
- etc.

## Running Solutions

You can run the solutions in multiple ways:

### Run All Solutions

```bash
mix run -e "Aoc24.run_all"
```

### Run a Specific Day

```bash
mix run -e "Aoc24.run_day(1, 1)"  # Run Day 1, Part 1
```

Each solution will display its result and execution time.

## Prerequisites

- Elixir
- Mix (Elixir's build tool)

## Installation

```bash
# Clone the repository
git clone git@github.com:bigtallbill/Advent-Of-Code-2024.git

# Install dependencies
mix deps.get
```

## Testing

Run the test suite with:

```bash
mix test
```

## Installing Elixir

For most operating systems, see the [official installation guide](https://elixir-lang.org/install.html#by-operating-system).

For NixOS, you can run Elixir without installing it:

```bash
nix-shell -p elixir_1_16
```
