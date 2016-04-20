require_relative 'station'

class Journey

attr_reader :entry_station, :exit_station

ZONE_FARE = 1
PENALTY_FEE = 6

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

  def calculate_fare
<<<<<<< HEAD
    return PENALTY_FEE if entry_station == nil #or exit_station == nil
=======
    return PENALTY_FEE if !complete?
>>>>>>> day-three
    (ZONE_FARE * ( entry_station.zone - exit_station.zone )).abs + ZONE_FARE
  end
end
