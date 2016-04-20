require_relative 'journey'

class JourneyLog

	attr_reader :current_journey

	def initialize(current_journey = Journey.new)
		@current_journey = current_journey
		@journeys = []
	end

	def start(station)
		current_journey.start(station)
		update_journey
	end

	def finish(station)
		current_journey.finished(station)
		store_journey
		update_journey
	end

	def journeys
		@journeys.dup
	end

	private

	def update_journey
		return current_journey if current_journey.entry_station != nil && current_journey.exit_station === nil
		@current_journey = Journey.new
	end

	def store_journey
		@journeys << current_journey
	end

end
