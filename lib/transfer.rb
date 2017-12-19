class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def both_valid?
   return sender.valid? && receiver.valid?
  end

  def execute_transaction
    unless self.status == "complete"
      if sender.valid? == false || sender.balance <= amount
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
      elsif both_valid?
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
      end
    end
    return status
  end

  def reverse_transfer
    if self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    elsif self.status == "rejected" || self.status == "pending"
      return "Transaction rejected. Please check your account balance."
    end
  end

end

=begin
class Transfer
  attr_reader :amount, :sender, :receiver
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if both_valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      reject_transfer
    end
  end

  def reverse_transfer
    if both_valid? && receiver.balance > amount && self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end
=end
