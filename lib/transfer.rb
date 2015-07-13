class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def both_valid?
    if sender.valid? && receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
    if status == "pending" && sender.balance > amount
      sender.balance -= amount 
      receiver.balance += amount
      @status = "complete"
    elsif !(sender.balance > amount) && status == "pending"
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."  
    else
    end
  end

  def reverse_transfer
    if status == "complete"
      sender.balance += amount 
      receiver.balance -= amount
      @status = "reversed"
    else 
    end
  end

end