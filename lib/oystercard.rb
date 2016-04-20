require_relative 'station'
require_relative 'journey'

class Oystercard

  attr_reader :balance, :journeys, :journey

  MAX_LIMIT = 90
  MIN_FARE = 1

  def initialize(journey = Journey.new)
    @balance = 0
    @journeys = []
    @journey = journey
  end

  def top_up money
    fail "Max limit of #{MAX_LIMIT} reached" if balance + money > MAX_LIMIT
    @balance += money
  end

  def touch_in (entry_station)
    fail "Balance is less than #{MIN_FARE}" if balance < MIN_FARE
    @journey.start(entry_station)
  end

  def touch_out exit_station
    @journey.finished(exit_station)
    deduct @journey.calculate_fare
    save_and_reset_journey
  end

  private

  def reset_journey
    @journey = Journey.new
  end

  def save_and_reset_journey
    @journeys.push @journey
    reset_journey
  end

  def deduct money
    @balance -= money
  end
end
