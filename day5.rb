# frozen_string_literal: true

class Day5
  def initialize(input_file)
    @input_file = input_file
    file_data
  end

  def part1
    rearangments.each do |number, from, to|
      (1..number).each do |_|
        perform_rearangment(from, to)
      end
    end

    get_word
  end

  def part2
    rearangments.each do |number, from, to|
      map[(to - 1)] += map[(from - 1)].pop(number)
    end

    get_word
  end

  private

  attr_reader :input_file
  attr_accessor :map, :rearangments

  def file_data
    raw_data = File.read(input_file)
    map_input, rearangments_input = raw_data.split("\n\n")
    @map = parse_map(map_input)
    @rearangments = parse_rearangments(rearangments_input)
  end

  def parse_rearangments(rearangments)
    rearangments.split("\n").map do |rearangment|
      split = rearangment.split(' ')
      [split[1].to_i, split[3].to_i, split[5].to_i]
    end
  end

  def parse_map(map_input)
    reversed_input = map_input.split("\n").reverse
    input_ids = reversed_input.first.split(' ')
    input_ids_index = input_ids.map do |id|
      reversed_input.first.index(id)
    end
    reversed_input.shift

    output = Array.new(input_ids.last.to_i) { [] }
    reversed_input.each do |line|
      input_ids_index.each_with_index do |offset, index|
        output[index] << line[offset]
      end
    end

    output.map do |element|
      element.delete_if { |e| e.nil? || e == ' ' }
    end
  end

  def perform_rearangment(from, to)
    map[(to - 1)] << map[(from - 1)].pop
  end

  def get_word
    map.reduce("") do |word, stack|
      word + stack.last
    end
  end
end
