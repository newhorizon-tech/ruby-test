class Account
  attr_reader :name
  attr_reader :balance

  def initialize(name, balance = 100)
    @name = name
    @balance = balance
  end

  private def pin
    @pin = 1234
  end

  private def pin_error
    'Access denied: incorrect PIN.'
  end

  public def display_balance(pin_number)
    if pin_number == pin
      puts "Balance:$#{@balance}"
    else
      puts pin_error
    end
  end

  public def withdraw(pin_number, amount)
    if pin_number == pin
      if (@balance - amount) > -1
        @balance -= amount
        puts "Withdrew #{amount}. New Balance:$#{@balance}"
      else
        puts 'Not enough money in your account'
      end
    else
      puts pin_error
    end
  end

  public def deposit(pin_number, amount)
    if pin_number == pin
      @balance += amount
      puts "Deposited #{amount}. New Balance:$#{@balance}"
    else
      puts pin_error
    end
  end
end

checking_account = Account.new('Alaukik', 2000)
checking_account.display_balance(1234)

checking_account.withdraw(1234, 50)

checking_account.deposit(1234, 10_000_000)

checking_account.withdraw(1234, 5_000_000)

checking_account.withdraw(1234, 5_000_000)

checking_account.withdraw(1234, 1950)

checking_account.withdraw(1234, 1)
