class DifferentCurrencyCodeError < StandardError
  def initialize(msg="currency codes are different")
    super
  end
end
