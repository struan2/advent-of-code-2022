# frozen_string_literal: true

require_relative '../day5'

RSpec.describe Day5 do
  subject(:day5_test) { Day5.new('spec/fixtures/day5_test.txt') }
  subject(:day5_actual) { Day5.new('spec/fixtures/day5_actual.txt') }

  describe '#part1' do
    it 'returns the correct value' do
      expect(day5_test.part1).to eq("CMZ")
    end

    it 'returns the correct value' do
      expect(day5_actual.part1).to eq("SPFMVDTZT")
    end
  end

  describe '#part2' do
    it 'returns the correct value' do
      expect(day5_test.part2).to eq("MCD")
    end

    it 'returns the correct value' do
      expect(day5_actual.part2).to eq("ZFSJBPRFP")
    end
  end
end
