require_relative 'station'

class Oystercard

  attr_reader :balance, :journeys

  MAX_LIMIT = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @in_journey = false
    @entry_station = nil
    @journeys = []
  end

  def top_up money
    fail "Max limit reached - Card will contain more than #{MAX_LIMIT} GBP - Top up less" if balance + money > MAX_LIMIT
    @balance += money
  end

  def in_journey?
   !!entry_station
  end

  def add_history (exit_station)
    journey = {entry_station: entry_station, exit_station: exit_station}
    @journeys.push journey
  end


  def touch_in entry_station
    fail "No balance is less than 1 GBP - Can't pay for journey - Top that shit up" if balance < 1
  #  @journey = Journey.new(station)
    @entry_station = entry_station
  end

  def touch_out exit_station
    deduct MIN_FARE
    add_history(exit_station)
    @entry_station = nil
  end

  private

  def deduct money
    @balance -= money
  end

  attr_reader :in_journey, :entry_station


end
