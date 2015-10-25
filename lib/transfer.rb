require 'pry'

class Transfer

  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver  
    @status = "pending"
    @amount = amount
  end

  def both_valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if self.both_valid? && self.status == "pending" && sender.balance > @amount
      sender.deposit(-@amount)
      receiver.deposit(@amount)
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.deposit(@amount)
      receiver.deposit(-@amount)
      self.status = "reversed"
    end
  end

end