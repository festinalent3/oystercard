require 'journey'



describe Journey do
let(:journey) {described_class.new}
let(:entry_station) { double :entry_station }
let(:exit_station) { double :exit_station }


  it 'starts a journey' do
    expect { journey.start(entry_station) }.to change{ (journey.entry_station) }.to entry_station
  end

  it 'finishes a journey' do
    expect { journey.finished(exit_station) }.to change{ (journey.exit_station) }.to exit_station
  end

  it 'calculates fare' do
    journey.start(entry_station)
    journey.finished(exit_station)

    expect(journey.calculate_fare).to eq(2 * Journey::ZONE_FARE)

  end

end
#
# ZONE_FARE = 1
#
# journey.calculate_fare
#
# (ZONE_FARE * abs( entry_station.zone - exit_station.zone )) + ZONE_FARE
#
# (3 - 4).abs = 1 + 1





#
#
#
# --> tha fare

# calculating the fare of a journey,
# and returning whether or not the journey is complete.
