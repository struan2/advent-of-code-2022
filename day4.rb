# frozen_string_literal: true

require 'set'

class Day4
  def initialize(input_file)
    @input_file = input_file
  end

  def part1
    file_data.keep_if do |range1, range2|
      range_contained_set_logic?(range1, range2)
    end.count
  end

  def part2
    file_data.map do |range1, range2|
      overlaping_elements(range1, range2)
    end.delete_if(&:empty?).count
  end

  private

  attr_reader :input_file

  def file_data
    raw_data = File.read(input_file)
    raw_data.split("\n").map { |e| e.split(',').map { |a| create_range(a.split('-').map(&:to_i)) } }
  end

  def create_range(array)
    array[0]..array[1]
  end

  # For some reason cover didn't work (worked it out didn't convert to_i)
  def range_contained?(range1, range2)
    range1.cover?(range2) || range2.cover?(range1)
  end

  def range_contained_set_logic?(range1, range2)
    r1 = range1.to_a.to_set
    r2 = range2.to_a.to_set

    r1.subset?(r2) || r2.subset?(r1)
  end

  def overlaping_elements(range1, range2)
    r1 = range1.to_a.to_set
    r2 = range2.to_a.to_set

    r1 & r2
  end
end
