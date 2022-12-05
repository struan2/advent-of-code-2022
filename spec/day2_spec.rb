require_relative "../day2"

RSpec.describe Day2 do
  subject(:day2_test) { Day2.new("spec/fixtures/day2_test.txt") }
  subject(:day2_actual) { Day2.new("spec/fixtures/day2_actual.txt") }

  describe "#part1" do
    it "returns the correct value" do
      expect(day2_test.part1).to eq(15)
    end

    it "returns the correct value" do
      expect(day2_actual.part1).to eq(14375)
    end
  end

  describe "#part2" do
    it "returns the correct value" do
      expect(day2_test.part2).to eq(12)
    end

    it "returns the correct value" do
      expect(day2_actual.part2).to eq(10274)
    end
  end
end
