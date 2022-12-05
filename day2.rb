class Day2

  OUR_SHAPE_PART_2 = {
    "A": { "X": "C", "Y": "A", "Z": "B" },
    "B": { "X": "A", "Y": "B", "Z": "C" },
    "C": { "X": "B", "Y": "C", "Z": "A" }
  }

  ROUND_2_WIN_SCORE = {
    "X": 0,
    "Y": 3,
    "Z": 6,
  }

  def initialize(input_file)
    @input_file = input_file
  end

  def part1
    file_data.reduce(0) do |total, input|
      opponent, us = input
      total += shape_score(us)
      total += win_score(opponent, us)
    end
  end

  def part2
    file_data.reduce(0) do |total, input|
      opponent, action = input
      our_shape = our_shape(opponent, action)
      total += shape_score(our_shape)
      total += ROUND_2_WIN_SCORE[action.to_sym]
    end
  end

  private

  attr_reader :input_file

  def file_data
    raw_data = File.read(input_file)
    split_data = raw_data.split("\n").map{ |e| e.split(" ") }
  end

  def our_shape(opponent, action)
    OUR_SHAPE_PART_2[opponent.to_sym][action.to_sym]
  end

  def shape_score(shape)
    case shape
    when "X", "A"
      1
    when "Y", "B"
      2
    when "Z", "C"
      3
    end
  end

  def win_score(opponent, us)
    us = normalise_shapes(us)
    return 3 if us == opponent
    if us == "A" && opponent == "C"
      6
    elsif us == "C" && opponent == "B"
      6
    elsif us == "B" && opponent == "A"
      6
    else
      0
    end
  end

  def normalise_shapes(shape)
    case shape
    when "X"
      "A"
    when "Y"
      "B"
    when "Z"
      "C"
    end
  end
end
