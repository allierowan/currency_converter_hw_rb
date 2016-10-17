require_relative "./different_currency_code_error"
require_relative "./unknown_currency_code_error"

class Currency
  CURRENCY_SYMBOLS = {"$" => "USD", "€" => "Euro"}
  # initialize currency object with an amount and a currency code
  def initialize(amount, code = nil)
    raise ArgumentError if !( amount && code ) && !amount.is_a?(String)

    if amount.is_a? String
      raise UnknownCurrencyCodeError unless CURRENCY_SYMBOLS[amount[0]]
      @code = CURRENCY_SYMBOLS[amount[0]]
      @amount = amount[1, amount.length - 1].to_f

    else
      @amount = amount
      @code = code

    end
  end

  # method to access the amount of a currency
  def amount
    @amount
  end

  # method to access the code of a currency
  def code
    @code
  end

  # two currency objects should equal each other if and only if both the amount and the currency code are the same
  def ==(other)
    self.amount == other.amount && self.code == other.code
  end

  # a currency object should be able to be added to another one with the same code
  # should raise a DifferentCurrencyCodeError when code is different
  def +(other)
    raise DifferentCurrencyCodeError if self.code != other.code
    new_amount = self.amount + other.amount
    Currency.new(new_amount, self.code)
  end

  # a currency object should be able to be subtracted from another one with the same code
  # should raise a DifferentCurrencyCodeError when code is different
  def -(other)
    raise DifferentCurrencyCodeError if self.code != other.code
    new_amount = self.amount - other.amount
    Currency.new(new_amount, self.code)
  end

  # when multiplied by a fixnum or a float, should return a currency object
  def *(number)
    new_amount = self.amount*number
    Currency.new(new_amount, self.code)
  end

end
