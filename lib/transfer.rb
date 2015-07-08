class Transfer
  # code here
  attr_reader :sender, :receiver, :amount, :status
  def initialize(from, to, sum)
    @sender = from
	@receiver = to
	@amount = sum
	@status = "pending"
  end
  def both_valid?
	sender.valid? && receiver.valid?
  end
  def execute_transaction
	return unless @status == "pending"
	  
	@sender.balance -= @amount
    if @sender.valid? then
	  @receiver.balance += @amount
	  @status = "complete"
	else  
	  @sender.balance += @amount
      @status = "rejected"
	  "Transaction rejected. Please check your account balance."
	end	
  end
  def reverse_transfer
    return unless @status == "complete"
	
	@sender.balance += @amount
	@receiver.balance -= @amount
	@status = "reversed"
  end
end