# frozen_string_literal: true

require_relative '../day12'

RSpec.describe Day12 do
  subject(:day12_test) { Day12.new('spec/fixtures/day12_test.txt') }
  subject(:day12_actual) { Day12.new('spec/fixtures/day12_actual.txt') }

  describe '#part1' do
    it 'returns the correct value' do
      expect(day12_test.part1).to eq(31)
    end

    it 'returns the correct value', pending: true do
      expect(day12_actual.part1).to eq(0)
    end
  end

  describe '#part2' do
    it 'returns the correct value' do
      expect(day12_test.part2).to eq(0)
    end

    it 'returns the correct value', pending: true do
      expect(day12_actual.part2).to eq(0)
    end
  end
end
