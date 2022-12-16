# frozen_string_literal: true

require "set"

class Day12

  TRANSFORMATIONS = [
    [-1, 0],
    [1, 0],
    [0, -1],
    [0, 1]
  ]

  def initialize(input_file)
    @input_file = input_file
    file_data
  end

  def part1
    queue = []
    queue << [current_point.dup, 0]
    visited = Set.new
    visited << current_point.dup
    # puts "#{raw_data.size} #{raw_data.first.size}"

    while !queue.empty?
      item, element = queue.shift
      item_letter = raw_data[item[0]][item[1]]
      puts "#{item} #{item_letter} #{element}"

      return element if item_letter == "E"

      TRANSFORMATIONS.
        map { |i, j| [i+item[0], j+item[1]] }.
        keep_if { |i, j| i >= 0 && j >= 0 && i <= max_i && j <= max_j }.
        reject { |e| visited.include?(e) }.each do |i, j|
          # puts "#{[i,j]} #{visited.include?([i,j])}"
          new_letter = raw_data[i][j]
          # puts "found it #{element}" if new_letter == "E"
          if item_letter.ord == new_letter.ord || item_letter.ord == (new_letter.ord-1) || (new_letter == "E" && item_letter == "z")
            queue << [[i,j], element+1]
            # puts "#{queue} - #{[i,j]}"
            visited << [i,j]
          end
      end
    end
  end

  def part2

  end

  private

  attr_reader :input_file, :raw_data, :max_i, :max_j
  attr_accessor :current_point, :current_element

  def file_data
    @raw_data = File.read(input_file).split("\n").map{ |e| e.split('') }
    start_point_i = raw_data.find_index { |e| e.include?('S') }
    start_point_j = raw_data[start_point_i].find_index { |e| e == 'S' }
    @current_point = [start_point_i, start_point_j]
    raw_data[start_point_i][start_point_j] = "a"
    @max_i = raw_data.size - 1
    @max_j = raw_data.first.size - 1
  end
end
