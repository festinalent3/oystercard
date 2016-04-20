class OysterCard

  LIMIT = 90

  attr_reader :balance
  def initialize
    @balance = 0
  end

  def top_up(num)
    @num = num
    fail "Cannot add more than #{LIMIT}" if reach_limit?
  	@balance += num
  end

  def deduct(fare)
  	@balance -= fare
  end

  def reach_limit?
    balance + @num > 90
  end
end