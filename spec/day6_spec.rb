# frozen_string_literal: true

require_relative '../day6'

RSpec.describe Day6 do
  subject(:day6_test1) { Day6.new('spec/fixtures/day6_test1.txt') }
  subject(:day6_test2) { Day6.new('spec/fixtures/day6_test2.txt') }
  subject(:day6_test3) { Day6.new('spec/fixtures/day6_test3.txt') }
  subject(:day6_test4) { Day6.new('spec/fixtures/day6_test4.txt') }
  subject(:day6_test5) { Day6.new('spec/fixtures/day6_test5.txt') }
  subject(:day6_actual) { Day6.new('spec/fixtures/day6_actual.txt') }

  describe '#part1' do
    it 'returns the correct value for test 1' do
      expect(day6_test1.part1).to eq(7)
    end

    it 'returns the correct value for test 2' do
      expect(day6_test2.part1).to eq(5)
    end

    it 'returns the correct value for test 3' do
      expect(day6_test3.part1).to eq(6)
    end

    it 'returns the correct value for test 4' do
      expect(day6_test4.part1).to eq(10)
    end

    it 'returns the correct value for test 5' do
      expect(day6_test5.part1).to eq(11)
    end

    it 'returns the correct value' do
      expect(day6_actual.part1).to eq(1544)
    end
  end

  describe '#part2' do
    it 'returns the correct value for test 1' do
      expect(day6_test1.part2).to eq(19)
    end

    it 'returns the correct value for test 2' do
      expect(day6_test2.part2).to eq(23)
    end

    it 'returns the correct value for test 3' do
      expect(day6_test3.part2).to eq(23)
    end

    it 'returns the correct value for test 4' do
      expect(day6_test4.part2).to eq(29)
    end

    it 'returns the correct value for test 5' do
      expect(day6_test5.part2).to eq(26)
    end

    it 'returns the correct value' do
      expect(day6_actual.part2).to eq(2145)
    end
  end
end
