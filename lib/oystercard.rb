<<<<<<< HEAD
class OysterCard
=======
class Oystercard

attr_reader :balance
>>>>>>> eeb5a3ffcc08a9e420a91aca434311412ec3236d

  MAX_LIMIT = 90
  MIN_FARE = 1

<<<<<<< HEAD
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "Maximum limit exceeded by #{(balance + amount) - MAX_LIMIT}!" if balance + amount > MAX_LIMIT
    @balance += amount
=======
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
>>>>>>> eeb5a3ffcc08a9e420a91aca434311412ec3236d
  end

  def in_journey?
    in_journey
  end

  def touch_in
<<<<<<< HEAD
    fail 'Not enough money for journey' if balance < MIN_FARE
=======
    fail "No balance is less than 1 GBP - Can't pay for journey - Top that shit up" if balance < 1
>>>>>>> eeb5a3ffcc08a9e420a91aca434311412ec3236d
    @in_journey = true
  end

  def touch_out
<<<<<<< HEAD
    deduct(MIN_FARE)
    @in_journey = false
  end

  private
  attr_reader :in_journey

  def deduct(fare)
    @balance -= fare
  end
=======
    deduct MIN_FARE
    @in_journey = false
  end

private

attr_reader :in_journey

>>>>>>> eeb5a3ffcc08a9e420a91aca434311412ec3236d

end
