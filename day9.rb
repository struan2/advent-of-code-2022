# frozen_string_literal: true

require "set"

class Day9
  def initialize(input_file)
    @input_file = input_file
    @head = [0, 0]
    @tail = [0, 0]
    @places_tail = Set.new
    places_tail << [0, 0]
  end

  def part1
    file_data.each do |movement, number|
      (1..number).each do |_|
        movement(movement)
      end
    end
  end

  def part2

  end

  private

  attr_reader :input_file
  attr_accessor :head, :tail, :places_tail

  def file_data
    File.read(input_file).split("\n").map { |e| [e.split(" ").first, e.split(" ").last.to_i] }
  end

  def movement(movement)
    case movement
    when "R"
      
    when "U"

    when "L"

    when "D"

    end
  end

  def is_diag?(x, y, i, j)
    false
  end
end
