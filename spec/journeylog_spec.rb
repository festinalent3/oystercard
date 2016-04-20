require 'journeylog'

describe JourneyLog do

	let(:journey) { double(:journey) }
	let(:station) { double(:station) }
	let(:current_journey_double) { double(:current_journey_double, start: journey, entry_station: 'Not nil', exit_station: nil, finished: station )}
	let(:log) { described_class.new(current_journey_double) }

	it 'initialized with Journey class' do
		log = JourneyLog.new(journey)
		expect(log.current_journey).to eq journey
	end

	describe '#start' do
		it 'starts journey' do
			expect(current_journey_double).to receive(:start).with(station)
			log.start(station)
		end
	end

	describe '#current_journey' do
		it 'returns current journey' do
			expect{ log.start(station) }.not_to change{ log.current_journey }
		end
	end

	describe '#finish' do
		it 'update journey with exit station' do
			log.finish(station)
			expect(log.current_journey).to have_received(:finished)
		end
		it 'creates a new journey' do
			log = described_class.new
			log.start(station)
			expect{ log.finish(station) }.to change{ log.current_journey }
		end
	end

	describe '#journeys' do
		it 'returns array of journeys' do
			log.finish(station)
			expect(log.journeys).to include current_journey_double
		end
	end

end
