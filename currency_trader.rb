require_relative "./currency"
require_relative "./currency_converter"

class CurrencyTrader

  # currency trader object should be initialized with two currency converter objects from 2 diff points in time
  def initialize(converter1, converter2, start_currency)
    @converter1 = converter1
    @converter2 = converter2
    @start_currency = start_currency

  end

  # this method should tell you which currency you would get the best returns on given two converter inputs
  def best_bet_currency
    start_value = Currency.new(1, start_currency)
    possible_currencies = converter1[keys]
    possible_currencies.each do |code, conversion|
      
    end
    converted_value = converter1.convert(start_value, converter1.rates_lookup[])
  end
end
