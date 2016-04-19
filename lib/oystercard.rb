class Oystercard

attr_reader :balance

  MAX_LIMIT = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up money
    fail "Max limit reached - Card will contain more than #{MAX_LIMIT} GBP - Top up less" if balance + money > MAX_LIMIT
    @balance += money
  end

  def deduct money
    @balance -= money
  end

  def in_journey?
    in_journey
  end

  def touch_in
    fail "No balance is less than 1 GBP - Can't pay for journey - Top that shit up" if balance < 1
    @in_journey = true
  end

  def touch_out
    deduct MIN_FARE
    @in_journey = false
  end

private

attr_reader :in_journey


end
