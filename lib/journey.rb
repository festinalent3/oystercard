require_relative 'station'
require_relative 'fare_calculator'

class Journey

  attr_reader :entry_station, :exit_station

  def initialize
    @entry_station = nil
    @exit_station = nil
  end

  def start(station)
    @entry_station = station
  end

  def finished(station)
    @exit_station = station
  end

  def complete?
    !!entry_station && !!exit_station
  end

end
