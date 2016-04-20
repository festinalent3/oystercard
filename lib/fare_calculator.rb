class FareCalculator

  ZONE_FARE = 1
  PENALTY_FEE = 6

  def initialize(journey)
    @journey = journey
  end

  def calculate_fare
    return PENALTY_FEE if !(@journey.complete?) || (@journey.entry_station.zone == @journey.exit_station.zone)
    (ZONE_FARE * ( @journey.entry_station.zone - @journey.exit_station.zone )).abs + ZONE_FARE
  end

end
