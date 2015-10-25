class BankAccount

  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(deposit) 
    self.balance=(self.balance += deposit)
  end

  def display_balance
    "Your Balance is $#{self.balance}."
  end

  def valid?
    if self.status == "open" && self.balance > 0
      true
    else
      false
    end 
  end

  def close_account
    self.status = "closed"
  end

end