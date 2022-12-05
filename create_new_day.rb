def create_day_file(day_number)
  file_data = <<~TEXT
  # frozen_string_literal: true

  class Day#{day_number}
    def initialize(input_file)
      @input_file = input_file
    end

    def part1

    end

    def part2

    end

    private

    attr_reader :input_file

    def file_data
      raw_data = File.read(input_file)
    end
  end
  TEXT
  File.write("day#{day_number}.rb", file_data)
end

def create_day_spec_file(day_number)
  file_data = <<~TEXT
  # frozen_string_literal: true

  require_relative '../day#{day_number}'

  RSpec.describe Day#{day_number} do
    subject(:day#{day_number}_test) { Day#{day_number}.new('spec/fixtures/day#{day_number}_test.txt') }
    subject(:day#{day_number}_actual) { Day#{day_number}.new('spec/fixtures/day#{day_number}_actual.txt') }

    describe '#part1' do
      it 'returns the correct value' do
        expect(day#{day_number}_test.part1).to eq(0)
      end

      it 'returns the correct value', pending: true do
        expect(day#{day_number}_actual.part1).to eq(0)
      end
    end

    describe '#part2' do
      it 'returns the correct value' do
        expect(day#{day_number}_test.part2).to eq(0)
      end

      it 'returns the correct value', pending: true do
        expect(day#{day_number}_actual.part2).to eq(0)
      end
    end
  end
  TEXT
  File.write("spec/day#{day_number}_spec.rb", file_data)
end

def create_day_spec_fixture(day_number)
  File.write("spec/fixtures/day#{day_number}_test.txt", "Sample Goes Here")
  File.write("spec/fixtures/day#{day_number}_actual.txt", "Sample Goes Here")
end

day_number = ARGV[0]

create_day_spec_fixture(day_number)
create_day_spec_file(day_number)
create_day_file(day_number)
