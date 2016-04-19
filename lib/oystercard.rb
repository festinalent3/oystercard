class Oystercard

  attr_reader :balance

  MAX_LIMIT = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @in_journey = false
    @entry_station = nil
  end

  def top_up money
    fail "Max limit reached - Card will contain more than #{MAX_LIMIT} GBP - Top up less" if balance + money > MAX_LIMIT
    @balance += money
  end

  def in_journey?
    !!entry_station
  end


  def touch_in station = true
    fail "No balance is less than 1 GBP - Can't pay for journey - Top that shit up" if balance < 1
    @entry_station = station
  end

  def touch_out
    deduct MIN_FARE
    @entry_station = nil
  end

  private

  def deduct money
    @balance -= money
  end

  attr_reader :in_journey, :entry_station


end
