require 'fare_calculator'

describe FareCalculator do
  let(:entry_station) { double(:entry_station, zone: 1) }
  let(:exit_station) { double(:exit_station, zone: 2) }
  let(:journey) { double(:journey, complete?: true, entry_station: entry_station, exit_station: exit_station)}
  let(:calculator) { described_class.new(journey)}

  it 'calculates fare' do
    allow(journey).to receive(:entry_station).with(:zone).and_return(1)
    allow(journey).to receive(:exit_station).with(:zone).and_return(2)
    expect(calculator.calculate_fare).to eq(2 * FareCalculator::ZONE_FARE)
  end

  it 'deducts penalty fee when someone forgot to touch in and then touches out' do
    allow(journey).to receive(:complete?).and_return false
    expect(calculator.calculate_fare).to eq(FareCalculator::PENALTY_FEE)
  end

  it 'deducts penalty fee when someone forgot to touch out and then touches in' do
    allow(journey).to receive(:complete?).and_return false
    expect(calculator.calculate_fare).to eq(FareCalculator::PENALTY_FEE)
  end

end
