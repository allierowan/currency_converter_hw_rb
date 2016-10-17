require_relative "./currency"
require_relative "./currency_converter"
require_relative "./currency_trader"

ten_dollars = Currency.new(10, "USD")
thirty_dollars = Currency.new(30, "USD")
one_eur = Currency.new(1, "EUR")

thirty_dollars == ten_dollars

forty_dollars = ten_dollars + thirty_dollars

twenty_dollars = thirty_dollars - ten_dollars

fifty_dollars = ten_dollars*5

currency_converter1 = CurrencyConverter.new({"USD" => 1.0, "EUR" => 0.74, "JPY" => 120.0, "CUR" => 5})
currency_converter2 = CurrencyConverter.new({"USD" => 1.0, "EUR" => 0.8, "JPY" => 150.0, "CUR" => 4.9})

currency_converter1.convert(ten_dollars, "EUR")
currency_converter1.convert(one_eur, "CUR")

currency_converter1.convert(Currency.new(1, "USD"), "USD") == Currency.new(1, "USD")

new_money = Currency.new("$5")

start_value = Currency.new(1, "EUR")
converted_value = currency_converter1.convert(start_value, "EUR")
currency_converter2.convert(converted_value, "EUR")

test_cur = Currency.new(0.74, "EUR")
currency_converter2.convert(test_cur, "USD")

trader = CurrencyTrader.new(currency_converter1, currency_converter2, "EUR")
trader.best_bet_currency
