require_relative 'station'

class Journey

attr_reader :entry_station, :exit_station

ZONE_FARE = 1
PENALTY_FEE = 6

  def initialize(station = nil) #= Station.new("test_name", 1))
    @entry_station = station
    @exit_station = nil
  end

  # def start
  #   @entry_station #= station
  # end

  def finished(station)
    @exit_station = station
  end

  def complete?
    !!entry_station && !!exit_station
  end

  def calculate_fare
    return PENALTY_FEE if entry_station == nil or exit_station == nil
    #ADD PENALTY FARE
    (ZONE_FARE * ( entry_station.zone - exit_station.zone )).abs + ZONE_FARE
  end
end

#Logic: If we never touch in we don't create an instance of Journey, meaning in this case entry_station will be = nil
# That makes it possible to raise an error when customers forgot to touch in and then touches out on another station
