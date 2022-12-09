# frozen_string_literal: true

require_relative '../day9'

RSpec.describe Day9 do
  subject(:day9_test) { Day9.new('spec/fixtures/day9_test.txt') }
  subject(:day9_actual) { Day9.new('spec/fixtures/day9_actual.txt') }

  describe '#part1' do
    it 'returns the correct value' do
      expect(day9_test.part1).to eq(0)
    end

    xit 'returns the correct value', pending: true do
      expect(day9_actual.part1).to eq(0)
    end
  end

  describe '#part2' do
    it 'returns the correct value' do
      expect(day9_test.part2).to eq(0)
    end

    xit 'returns the correct value', pending: true do
      expect(day9_actual.part2).to eq(0)
    end
  end
end
