# frozen_string_literal: true

class Day8
  def initialize(input_file)
    @input_file = input_file
    file_data
  end

  def part1
    raw_data.each_with_index.reduce(0) do |sum, (e, i)|
      sum + e.each_with_index.reduce(0) do |inner_sum, (_, j)|
        if visable?(i, j)
          inner_sum + 1
        else
          inner_sum
        end
      end
    end
  end

  def part2
    raw_data.each_with_index.map do |e, i|
      e.each_with_index.map do |_, j|
        scenic_score(i, j)
      end
    end.flatten.max
  end

  private

  attr_reader :input_file, :raw_data, :up_down_max, :left_right_max

  def file_data
    @raw_data = File.read(input_file).split("\n").map { |line| line.split("").map(&:to_i) }
    @up_down_max = raw_data.size - 1
    @left_right_max = raw_data.first.size - 1
  end

  def visable?(ud, lr)
    return true if ud.zero? || ud == up_down_max || lr.zero? || lr == left_right_max
    
    visable_ud?(ud, lr) || visable_lr?(ud, lr)
  end

  def visable_ud?(ud, lr)
    item = raw_data[ud][lr]
    first_truth = raw_data[0..(ud-1)].reduce(true) do |truthy, line|
      truthy && line[lr] < item
    end
    first_truth || raw_data[(ud+1)..].reduce(true) do |truthy, line|
      truthy && line[lr] < item
    end
  end

  def visable_lr?(ud, lr)
    item = raw_data[ud][lr]
    first_truth = raw_data[ud][0..(lr-1)].reduce(true) do |truthy, line_item|
      truthy && line_item < item
    end
    first_truth || raw_data[ud][(lr+1)..].reduce(true) do |truthy, line_item|
      truthy && line_item < item
    end
  end

  def scenic_score(ud, lr)
    return 0 if ud.zero? || ud == up_down_max || lr.zero? || lr == left_right_max

    score_ud(ud, lr) * score_lr(ud, lr)
  end

  def score_ud(ud, lr)
    item = raw_data[ud][lr]
    okay = true
    first_truth = raw_data[0..(ud-1)].reverse.map do |line|
      if line[lr] < item
        okay
      else
        if okay
          okay = false
          true
        else
          okay
        end
      end
    end
    okay = true
    second_truth = raw_data[(ud+1)..].map do |line|
      if line[lr] < item
        okay
      else
        if okay
          okay = false
          true
        else
          okay
        end
      end
    end

    up = first_truth.keep_if{ |e| e }.count 
    down = second_truth.keep_if{ |e| e }.count

    up * down
  end

  def score_lr(ud, lr)
    item = raw_data[ud][lr]
    okay = true
    first_truth = raw_data[ud][0..(lr-1)].reverse.map do |line_item|
      if line_item < item
        okay
      else
        if okay
          okay = false
          true
        else
          okay
        end
      end
    end
    okay = true
    second_truth = raw_data[ud][(lr+1)..].map do |line_item|
      if line_item < item
        okay
      else
        if okay
          okay = false
          true
        else
          okay
        end
      end
    end
    
    left = first_truth.keep_if{ |e| e }.count 
    right = second_truth.keep_if{ |e| e }.count

    left * right
  end
end
