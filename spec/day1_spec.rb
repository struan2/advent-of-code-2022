require_relative '../day1'

RSpec.describe Day1 do
  subject(:day1_test) { Day1.new('spec/fixtures/day1_test.txt') }
  subject(:day1_actual) { Day1.new('spec/fixtures/day1_actual.txt') }

  describe '#part1' do
    it 'returns the correct value' do
      expect(day1_test.part1).to eq(24_000)
    end

    it 'returns the correct value' do
      expect(day1_actual.part1).to eq(69_795)
    end
  end

  describe '#part2' do
    it 'returns the correct value' do
      expect(day1_test.part2).to eq(45_000)
    end

    it 'returns the correct value' do
      expect(day1_actual.part2).to eq(208_437)
    end
  end
end
