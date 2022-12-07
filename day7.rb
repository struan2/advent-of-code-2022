# frozen_string_literal: true

class Day7
  def initialize(input_file)
    @input_file = input_file
    file_data
    calc_sizes(["/"])
  end

  def part1
    file_system.values.keep_if { |v| v <= 100_000 }.sum
  end

  def part2
    space_avalible = 70_000_000 - file_system[["/"]] 
    space_to_free = 30_000_000 - space_avalible
    file_system.values.keep_if { |v| v >= space_to_free }.min
  end

  private

  attr_reader :input_file
  attr_accessor :file_system

  def file_data
    raw_data = File.read(input_file).split("\n")
    @file_system = Hash.new { |hash, key| hash[key] = [] }

    path = []
    raw_data.each do |line|
      case line[0]
      when '$'
        if line[2..3] == "cd"
          new_dir = line[5..]
          if new_dir == "/"
            path = ["/"]
          elsif new_dir == ".."
            path.pop
          else
            path << new_dir
          end
        else line[2..3] == "ls"
          # nothing to do
        end
      else
        split_line = line.split(' ')
        case split_line[0]
        when "dir"
          file_system[path.dup] << ["dir", split_line[1]]
        else
          file_system[path.dup] << [split_line[0].to_i, split_line[1]]
        end
      end
    end
  end

  def calc_sizes(item)
    size = file_system[item].map do |size_type, name|
      case size_type
      when "dir"
        calc_sizes(item.dup << name)
      else
        size_type
      end
    end
    file_system[item] = size.reduce(:+)
  end
end
