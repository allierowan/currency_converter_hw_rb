class CurrencyTrader

  # currency trader object should be initialized with two currency converter objects from 2 diff points in time
  def initialize(converter1, converter2, start_currency)
    @converter1 = converter1
    @converter2 = converter2
    @start_currency = start_currency
    
  end

end
