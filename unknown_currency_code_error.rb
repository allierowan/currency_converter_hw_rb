class UnknownCurrencyCodeError < StandardError
  def initialize(msg="currency code unkown")
    super
  end
end
