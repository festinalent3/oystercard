require_relative 'station'
require_relative 'journey'

class Oystercard

  attr_reader :balance, :journeys

  MAX_LIMIT = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @journeys = []
    # @journey = nil
  end

  def top_up money
    fail "Max limit of #{MAX_LIMIT} reached" if balance + money > MAX_LIMIT
    @balance += money
  end

  def in_journey?
    !@journey.complete?
  end

  def touch_in (entry_station = Station.new("test_name", 1))
    fail "Balance is less than #{MIN_FARE}" if balance < MIN_FARE
    @journey = Journey.new(entry_station)
    #@journey.start
  end

  def touch_out exit_station
    deduct MIN_FARE
    @journey.finished(exit_station)
    @journeys.push @journey
  end

  private

  def deduct money
    @balance -= money
  end

  attr_reader :in_journey, :entry_station


end
