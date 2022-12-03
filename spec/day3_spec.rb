# frozen_string_literal: true

require_relative '../day3'

RSpec.describe Day3 do
  subject(:day3_test) { Day3.new('spec/fixtures/day3_test.txt') }
  subject(:day3_actual) { Day3.new('spec/fixtures/day3_actual.txt') }

  describe '#part1' do
    it 'returns the correct value' do
      expect(day3_test.part1).to eq(157)
    end

    it 'returns the correct value' do
      expect(day3_actual.part1).to eq(7766)
    end
  end

  describe '#part2' do
    it 'returns the correct value' do
      expect(day3_test.part2).to eq(70)
    end

    it 'returns the correct value' do
      expect(day3_actual.part2).to eq(2415)
    end
  end
end
