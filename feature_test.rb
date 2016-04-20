require './lib/oystercard'
require './lib/station'
require './lib/journey'

#Initialize objects
card = Oystercard.new
entry_station = Station.new('Bank')
exit_station = Station.new('Old Street', 2)


#Scenario_01
card.top_up(90)
card.touch_in(entry_station)
p card.journey
puts
p card.journey.complete? # False
card.touch_out(exit_station)
puts
p card.journey
puts
p card.journeys
puts
p card.journeys.last.complete?
p card.journey.complete? # False
card.touch_in(exit_station)
card.touch_out(entry_station)
puts
p card.journeys



#Scenario_02
# card.top_up(90)
# p card.balance #Expect eq 90
# card.deduct(6)
# p card.balance #Expect eq 84


#Scenario_01
# card.top_up(80)
# p card.balance #Expect eq 80
# card.top_up(20)
# p card.balance #Expect eq 100