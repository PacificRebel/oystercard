# frozen_string_literal: true

class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  attr_reader :balance, :in_journey

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if amount + balance > MAXIMUM_BALANCE

    @balance += amount
    end

  def in_journey?
    in_journey
  end

  def touch_in
    raise 'Insufficient funds to travel' if insufficient_funds?

    @in_journey = true
  end

  def insufficient_funds?
    @balance < MINIMUM_BALANCE
  end

  def touch_out
    deduct(MINIMUM_BALANCE)
    @in_journey = false
  end

private
  def deduct(amount)
    @balance -= amount
  end

end
