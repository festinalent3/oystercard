require_relative 'station'
require_relative 'journey'

class Oystercard

  attr_reader :balance, :journey_log

  MAX_LIMIT = 90
  MIN_FARE = 1

  def initialize(journey_log = JourneyLog.new)
    @balance = 0
    @journey_log = journey_log
  end

  def top_up money
    fail "Max limit of #{MAX_LIMIT} reached" if balance + money > MAX_LIMIT
    @balance += money
  end

  def touch_in (entry_station)
    fail "Balance is less than #{MIN_FARE}" if balance < MIN_FARE
    @journey_log.start(entry_station)
  end

  def touch_out exit_station
    @journey_log.finish(exit_station)
    deduct @journey_log.journey_class.calculate_fare
  end

  private

    def deduct money
      @balance -= money
    end
end
