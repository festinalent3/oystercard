require 'journey'

describe Journey do
  let(:entry_station) { double :entry_station, zone: 1 }
  let(:exit_station) { double :exit_station, zone: 2 }
  let(:journey) { described_class.new entry_station }
  let(:forgot_touch_in) { described_class.new }


  it 'starts a journey' do #OBSOLETE NOW SINCE THAT HAPPEPNS AT INITIALIZATION
    #expect { journey.start }.to change{ (journey.entry_station) }.to entry_station
    #expect { journey.start(entry_station) }.to change{ (journey.entry_station) }.to entry_station
  end

  it 'finishes a journey' do
    expect { journey.finished(exit_station) }.to change{ (journey.exit_station) }.to exit_station
  end

  it 'calculates fare' do
  #  journey.
    journey.finished(exit_station)
    expect(journey.calculate_fare).to eq(2 * Journey::ZONE_FARE)
  end

  it 'deducts penalty fee when someone forgot to tocuh in and then touches out' do

    journey.finished(exit_station)
    expect(forgot_touch_in.calculate_fare).to eq(Journey::PENALTY_FEE)
  end

  it 'returns weather or not journey is complete' do
    #journey.start
    expect { journey.finished(exit_station) }.to change{ (journey.complete?) }.to true
  end

end
