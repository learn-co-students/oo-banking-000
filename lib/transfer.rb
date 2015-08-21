class Transfer
	attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, amount)
  	@sender = sender
  	@receiver = receiver
  	@status = "pending"
  	@amount = amount
  end

  def both_valid?
  	self.sender.valid? && self.receiver.valid? ? true : false
  end

  def execute_transaction
  	#faltaba que el monto de la transaccion no supere el amount que tiene el sender en su cuenta.

  	if self.status != "complete" && self.status != "rejected" && sender.balance >= self.amount
  	  sender.balance -= amount
  		receiver.balance += amount
  		self.status = "complete" 
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