require_relative 'journey'

class JourneyLog

	attr_reader :journey_class

	def initialize(journey_class = Journey.new)
		@journey_class = journey_class
		@journeys = []
	end

	def start(station)
		@journey_class.start(station)
		current_journey
	end

	def finish(station)
		@journey_class.finished(station)
		@journeys << journey_class
		current_journey
	end

	def journeys
		@journeys.dup
	end

	private

		def current_journey
			return @journey_class if @journey_class.entry_station != nil && @journey_class.exit_station === nil
			@journey_class = Journey.new
		end
end
