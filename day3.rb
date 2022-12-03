# frozen_string_literal: true

require 'set'

class Day3
  def initialize(input_file)
    @input_file = input_file
  end

  def part1
    file_data.reduce(0) do |sum, rucksack|
      sum + priority_score(duplicate_item(rucksack))
    end
  end

  def part2
    number_of_groups = (file_data.size / 3) - 1
    raise StandardError, "Not even groups #{number_of_groups}" if number_of_groups % 1 != 0

    set_data = file_data.map(&:to_set)

    common_letter_groups = (0..number_of_groups).each.map do |group_number|
      start_index = group_number * 3
      common_item(set_data[start_index..(start_index + 2)])
    end

    common_letter_groups.reduce(0) do |sum, common_item|
      sum + priority_score(common_item)
    end
  end

  private

  attr_reader :input_file

  def file_data
    raw_data = File.read(input_file)
    raw_data.split("\n").map { |e| e.split('') }
  end

  def duplicate_item(rucksack_items)
    half_array = rucksack_items.size / 2.0
    raise StandardError, "Half Array not whole #{half_array}" if half_array % 1 != 0

    first_half = rucksack_items[0..half_array - 1].to_set
    second_half = rucksack_items[half_array..].to_set
    (first_half & second_half).first
  end

  def priority_score(letter)
    case letter
    when 'a'..'z'
      letter.ord - 97 + 1
    when 'A'..'Z'
      letter.ord - 65 + 27
    end
  end

  def common_item(array_of_sets)
    array_of_sets.reduce(array_of_sets.first) { |acc, set| acc & set }&.first
  end
end
