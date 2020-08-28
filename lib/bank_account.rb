require 'pry'
class BankAccount

    attr_reader :name
    attr_accessor :balance, :status

    @@all = []

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open" 
        @@all << self
    end


    def deposit(amount)
        self.balance += amount
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        if self.balance > 0 && self.status == 'open'
            return true
        else self.balance <= 0
            return false
        end
    end

    def close_account
        self.status = 'closed'
    end

    def self.all
        @@all
    end
end
