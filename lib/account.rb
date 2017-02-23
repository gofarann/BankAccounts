require 'csv'

module Bank

  class Account
    attr_reader :balance, :id, :open_date


    def initialize(id, balance, open_date)

      if balance >= 0
        @balance = balance
      else
        raise ArgumentError.new "initial balance must be greater or equal to 0"
      end

      @id = id
      @open_date = open_date
    end

    def withdraw(withdrawl_amount)
      raise ArgumentError.new("withdrawl must be greater than 0") if withdrawl_amount < 0

      if @balance - withdrawl_amount >= 0
        @balance -= withdrawl_amount
      else
        print "your balance will be negative"
        return @balance
      end
    end


    def deposit(deposit_amount)
      if deposit_amount > 0
        @balance += deposit_amount
        return @balance
      else
        raise ArgumentError.new "deposits must be greater than 0"
        return @balance
      end
    end

    def balance
      return @balance
    end

    def self.all
      accounts_array = []

      CSV.open("/Users/adai/Documents/ada/projects/BankAccounts/support/accounts.csv").each do |line|
        accounts_array << Account.new(line[0].to_i, line[1].to_i, line[2])
      end
      return accounts_array
    end

    def self.find(id)

      CSV.open("/Users/adai/Documents/ada/projects/BankAccounts/support/accounts.csv").each do |line|
        if id.to_i = line[0].to_i
          found_account = Account.new(line[0].to_i, line[1].to_i, line[2])
          return found_account
        else
          puts "not a valid ID number"
        end
      end
    end

  end

end
