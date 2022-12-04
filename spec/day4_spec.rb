# frozen_string_literal: true

require_relative '../day4'

RSpec.describe Day4 do
  subject(:day4_test) { Day4.new('spec/fixtures/day4_test.txt') }
  subject(:day4_actual) { Day4.new('spec/fixtures/day4_actual.txt') }

  describe '#part1' do
    it 'returns the correct value' do
      expect(day4_test.part1).to eq(2)
    end

    it 'returns the correct value' do
      expect(day4_actual.part1).to eq(485)
    end
  end

  describe '#part2' do
    it 'returns the correct value' do
      expect(day4_test.part2).to eq(4)
    end

    it 'returns the correct value' do
      expect(day4_actual.part2).to eq(857)
    end
  end
end
