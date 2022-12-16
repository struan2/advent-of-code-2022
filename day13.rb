# frozen_string_literal: true

class Day13
  def initialize(input_file)
    @input_file = input_file
  end

  def part1
    file_data.map do |left, right|
      compare_data(left, right, true)
    end.each_with_index.map do |e, i|
      if e
        i + 1
      else
        nil
      end
    end.compact.reduce(:+)
  end

  def part2

  end

  private

  attr_reader :input_file

  def file_data
    raw_data = File.read(input_file).split("\n\n").map do |two_lines|
      left, right = two_lines.split("\n")

      [process_data(left, 0)[0], process_data(right, 0)[0]]
    end
  end

  def process_data(single_line, start_index)
    output = []
    index_at = start_index
    single_line.chars.each_with_index do |c, i|
      next unless i > index_at
      case c
      when "["
        data = process_data(single_line[(i+1)..], -1)
        output << data[0]
        index_at = data[1] + i
      when ","
        # Nothing to do
      when "]"
        return [output, i+1]
      else
        output << c.to_i
      end
    end
  end

  def compare_data(left_array, right_array, fail_on_mismatch)
    okay = true
    left_array.each_with_index do |left_item, i|
      right_item = right_array[i]

      if fail_on_mismatch && (right_array.size < left_array.size)
        return false
      end
      return okay if right_item.nil?

      case left_item
      when Integer
        if right_item.is_a?(Array)
          okay = okay && compare_data([left_item], right_item, false)
        else
          if left_item <= right_item
            okay = okay && true
          else
            return false
          end
        end
      when Array
        if right_item.is_a?(Integer)
          okay = okay && compare_data(left_item, [right_item], false)
        else
          okay = okay && compare_data(left_item, right_item, fail_on_mismatch)
        end
      end
    end

    okay
  end
end
