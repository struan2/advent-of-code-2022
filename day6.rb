# frozen_string_literal: true

class Day6
  def initialize(input_file)
    @input_file = input_file
    file_data
  end

  def part1
    find_unique_letters(4)
  end

  def part2
    find_unique_letters(14)
  end

  private

  attr_reader :input_file

  def file_data
    @file_data = File.read(input_file).split("")
  end

  def find_unique_letters(number)
    considered_letters = file_data.shift(number)
    return number if all_different_chars(considered_letters)

    file_data[number..].each_with_index do |letter, index|
      considered_letters.shift
      considered_letters << letter
      return (index + number + 1) if all_different_chars(considered_letters)
    end
    nil
  end

  def all_different_chars(array)
    hash = Hash.new(0)
    array.each do |e|
      hash[e] += 1
    end
    hash.all? { |_k,v| v <= 1 }
  end
end
