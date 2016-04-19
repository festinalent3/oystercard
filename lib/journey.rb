require_relative 'station'

class Journey

attr_reader :entry_station, :exit_station

ZONE_FARE = 1

  def initilize#(station)
    @entry_station = nil
    @exit_station = nil
  end

  def start(station)
    @entry_station = station
  end

  def finished(station)
    @exit_station = station
  end

  def calculate_fare
    (ZONE_FARE * ( entry_station.zone - exit_station.zone )).abs + ZONE_FARE
  end
end
