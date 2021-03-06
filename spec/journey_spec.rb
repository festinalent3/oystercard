require 'journey'

describe Journey do
  let(:entry_station) { double :entry_station, zone: 1 }
  let(:exit_station) { double :exit_station, zone: 2 }
  subject (:journey) { described_class.new }

  it 'starts a journey' do
    expect { journey.start(entry_station) }.to change{ (journey.entry_station) }.to entry_station
  end

  it 'finishes a journey' do
    expect { journey.finished(exit_station) }.to change{ (journey.exit_station) }.to exit_station
  end

  it 'returns weather or not journey is complete' do
    journey.start(entry_station)
    expect { journey.finished(exit_station) }.to change{ (journey.complete?) }.to true
  end

end
