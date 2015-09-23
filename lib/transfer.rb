require 'pry'

class Transfer
  # code here

  attr_accessor :sender, :receiver, :amount

  def initialize(from, to, amount)
    @sender = from
    @receiver = to
    @amount = amount
    @status = 'pending'
  end

  def sender
    @sender
  end


  def receiver
    @receiver
  end

  def status
    @status
  end

  def amount
    @amount
  end

  def both_valid?
    #could refactor to:
    #@sender.valid? && @receiver.valid?

    if sender.valid? && receiver.valid?
      return true
    end
  end


  def execute_transaction
    if sender.balance > amount
      if @status == 'pending'
        @sender.balance -= amount
        @receiver.balance += amount
        @status = "complete"
      end
    else
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
  end
  end

  def reverse_transfer

    if @status == 'complete'
      @sender.balance += amount
      @receiver.balance -= amount
      @status = 'reversed'
    end
  end

end