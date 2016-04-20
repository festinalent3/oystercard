require './lib/oystercard'

#Initialize objects
card = OysterCard.new



#Scenario_02
card.top_up(90)
p card.balance #Expect eq 90
card.deduct(6)
p card.balance #Expect eq 84


#Scenario_01
# card.top_up(80)
# p card.balance #Expect eq 80
# card.top_up(20)
# p card.balance #Expect eq 100