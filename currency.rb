class Currency

  # initialize currency object with an amount and a currency code
  def initialize(amount, currency_code)
    @amount = amount
    @currency_code = currency_code
  end

  # method to access the amount of a currency
  def amount
    @amount
  end

  # method to access the code of a currency
  def currency_code
    @currency_code
  end
  
  # two currency objects should equal each other if and only if both the amount and the currency code are the same
  def ==(other_currency)

  end

  # a currency object should be able to be added to another one with the same code
  # should raise a DifferentCurrencyCodeError when code is different
  def +(other_currency)

  end

  # a currency object should be able to be subtracted from another one with the same code
  # should raise a DifferentCurrencyCodeError when code is different
  def -(other_currency)

  end

  # when multiplied by a fixnum or a float, should return a currency object
  def *(number)

  end

end
