class OysterCard

  MAX_LIMIT = 90
  MIN_FARE = 1

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "Maximum limit exceeded by #{(balance + amount) - MAX_LIMIT}!" if balance + amount > MAX_LIMIT
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

  def in_journey?
    in_journey
  end

  def touch_in
    fail 'Not enough money for journey' if balance < MIN_FARE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  private
  attr_reader :in_journey




end
