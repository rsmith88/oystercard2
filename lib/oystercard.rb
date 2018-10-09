class OysterCard

  MAX_BALANCE = 90
  MIN_FARE = 3

  attr_reader :balance

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise "Maximum limit (£#{MAX_BALANCE}) exceeded" if @balance + amount > 90
    @balance += amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    raise "Not enough money on card" if @balance < 1
    @in_journey = true
  end

  def touch_out
    @in_journey = false
    deduct(MIN_FARE)
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
