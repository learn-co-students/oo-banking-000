class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(from, to, amount)
    @sender = from  
    @receiver = to
    @status = "pending"
    @amount = amount
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if both_valid? && sender.balance > amount
      if self.status != "complete" 
        sender.balance -= amount
        receiver.balance += amount
        self.status = "complete"
      end
    else 
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."  
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end
end