require 'pry'
class BankAccount
  # code here
    attr_accessor :balance

    attr_reader :name, :status

  def initialize(account_name)
    @name = account_name
    @balance = 1000
    @status = 'open'
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your Balance is $#{@balance}."
  end

  def valid?
    #refactor as:
    #@status == 'open' && @balance > 0
    if @status == 'open' && @balance > 0
      return true
    else
      return false
    end
  end

  def status=(change_status)
    @status = change_status
  end
 

  def close_account
    @status = "closed"
  end
end