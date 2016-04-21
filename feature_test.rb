require './lib/oystercard'
require './lib/station'
require './lib/journey'

#Initialize objects
card = Oystercard.new
entry_station = Station.new('Bank')
exit_station = Station.new('Old Street', 2)

#Scenario_01 - user completes a journey between two zones
puts 'first scenario - user completes a journey between two zones with 90 GBP in balance'
puts
card.top_up(90)
card.touch_in(entry_station)
card.touch_out(exit_station)
puts "new balance: #{card.balance}"
puts

#Scenario_02 -
puts 'second scenario - another journey is made and saved to journey log'
puts
card.touch_in(exit_station)
card.touch_out(entry_station)
puts 'Journey_log:'
p card.journey_log.journeys
puts
puts "new balance: #{card.balance}"
puts

#Scenario_03 - user forgets to touch in
puts'third scenario - user forgets to touch in and pays penalty fee'
puts
card.touch_out(exit_station)
puts "new balance: #{card.balance}"
puts 'Journey_log:'
p card.journey_log.journeys


### TO DO #####
#Scenario_04 - user touches in twice
puts'fourth scenario - user touches in twicc and pays penalty fee'
puts
card = Oystercard.new
card.top_up(90)

card.touch_in(entry_station)
card.touch_in(exit_station)
puts "new balance: #{card.balance}"
puts 'Journey_log:'
p card.journey_log.journeys
