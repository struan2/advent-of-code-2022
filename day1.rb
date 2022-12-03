# frozen_string_literal: true

class Day1
  def initialize(input_file)
    @input_file = input_file
  end

  def part1
    sumed_data.max
  end

  def part2
    sumed_data.max(3).reduce(:+)
  end

  private

  attr_reader :input_file

  def file_data
    raw_data = File.read(input_file)
    raw_data.split("\n\n").map { |e| e.split("\n").map(&:to_i) }
  end

  def sumed_data
    file_data.map { |e| e.reduce(:+) }
  end
end
