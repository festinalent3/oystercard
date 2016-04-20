require 'journeylog'

describe JourneyLog do
	
	let(:journey) { double(:journey) }
	let(:station) { double(:station) }
	let(:journey_class_double) { double(:journey_class_double, start: journey, entry_station: 'Not nil', exit_station: nil, finished: station )}
	let(:log) { described_class.new(journey_class_double) }

	it 'initialized with Journey class' do
		log = JourneyLog.new(journey)
		expect(log.journey_class).to eq journey
	end

	describe '#start' do
		it 'starts journey' do
			expect(journey_class_double).to receive(:start).with(station)
			log.start(station)
		end
	end

	describe '#current_journey' do
		it 'returns current journey' do
			expect{ log.start(station) }.not_to change{ log.journey_class }
		end
	end

	describe '#finish' do
		it 'update journey with exit station' do
			log.finish(station)
			expect(log.journey_class).to have_received(:finished)
		end
	end

	describe '#journeys' do
		it 'returns array of journeys' do
			log.finish(station)
			expect(log.journeys).to include journey_class_double
		end
	end

end


# a private 
# method #current_journey should return an incomplete 
# journey or create a new journey