# frozen_string_literal: true

require_relative '../day8'

RSpec.describe Day8 do
  subject(:day8_test) { Day8.new('spec/fixtures/day8_test.txt') }
  subject(:day8_actual) { Day8.new('spec/fixtures/day8_actual.txt') }

  describe '#part1' do
    it 'returns the correct value' do
      expect(day8_test.part1).to eq(21)
    end

    it 'returns the correct value' do
      expect(day8_actual.part1).to eq(1823)
    end
  end

  describe '#part2' do
    it 'returns the correct value' do
      expect(day8_test.part2).to eq(8)
    end

    it 'returns the correct value' do
      expect(day8_actual.part2).to eq(211_680)
    end
  end
end
