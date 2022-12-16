# frozen_string_literal: true

require_relative '../day13'

RSpec.describe Day13 do
  subject(:day13_test) { Day13.new('spec/fixtures/day13_test.txt') }
  subject(:day13_actual) { Day13.new('spec/fixtures/day13_actual.txt') }

  describe '#part1' do
    it 'returns the correct value' do
      expect(day13_test.part1).to eq(13)
    end

    it 'returns the correct value', pending: true do
      expect(day13_actual.part1).to eq(0)
    end
  end

  describe '#part2' do
    it 'returns the correct value' do
      expect(day13_test.part2).to eq(0)
    end

    it 'returns the correct value', pending: true do
      expect(day13_actual.part2).to eq(0)
    end
  end
end
