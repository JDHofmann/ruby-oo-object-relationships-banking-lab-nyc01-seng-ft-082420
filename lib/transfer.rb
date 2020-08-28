require 'pry'
class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  @@all =[]

  def initialize(sender, receiver , amount )
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = 'pending'
      @@all << []
  end

  def self.all
      @@all
  end

  def valid?
    # binding.pry
  self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction

    if self.status == "pending" && self.receiver.status == "open" && self.sender.status == "open"
      if self.sender.balance >= self.amount
        self.receiver.balance += amount
        self.sender.balance -= amount
        self.status = "complete"
      else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer
    if self.status == "complete"
      self.receiver.balance -= self.amount
      self.sender.balance += self.amount
      self.status = "reversed"
    end
  end

end