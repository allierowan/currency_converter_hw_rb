class Currency

  # initialize currency object with an amount and a currency code
  def initialize(amount, code)
    @amount = amount
    @code = code
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

  end

end
