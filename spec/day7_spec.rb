# frozen_string_literal: true

require_relative '../day7'

RSpec.describe Day7 do
  subject(:day7_test) { Day7.new('spec/fixtures/day7_test.txt') }
  subject(:day7_actual) { Day7.new('spec/fixtures/day7_actual.txt') }

  describe '#part1' do
    it 'returns the correct value' do
      expect(day7_test.part1).to eq(95437)
    end

    it 'returns the correct value', pending: true do
      expect(day7_actual.part1).to eq(0)
    end
  end

  describe '#part2' do
    it 'returns the correct value' do
      expect(day7_test.part2).to eq(24933642)
    end

    it 'returns the correct value', pending: true do
      expect(day7_actual.part2).to eq(0)
    end
  end
end
