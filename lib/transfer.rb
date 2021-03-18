require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if self.valid? && @status == "pending"
      receiver.balance += amount
      sender.balance -= amount
      @status = "complete"
      "What on earth is this thing doing?? Gadzooks"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end



end
