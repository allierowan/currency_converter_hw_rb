require_relative "./currency"                       # => true
require_relative "./different_currency_code_error"  # => false
require_relative "./currency_converter"             # => true
require_relative "./currency_trader"                # => true

ten_dollars = Currency.new(10, "USD")     # => #<Currency:0x007f85e4806710 @amount=10, @code="USD">
thirty_dollars = Currency.new(30, "USD")  # => #<Currency:0x007f85e4806120 @amount=30, @code="USD">
one_eur = Currency.new(1, "EUR")          # => #<Currency:0x007f85e4805b58 @amount=1, @code="EUR">

thirty_dollars == ten_dollars  # => false

forty_dollars = ten_dollars + thirty_dollars  # => #<Currency:0x007f85e4805158 @amount=40, @code="USD">

twenty_dollars = thirty_dollars - ten_dollars  # => #<Currency:0x007f85e4804c30 @amount=20, @code="USD">

fifty_dollars = ten_dollars*5  # => #<Currency:0x007f85e4804758 @amount=50, @code="USD">

currency_converter1 = CurrencyConverter.new({"USD" => 1.0, "EUR" => 0.74, "JPY" => 120.0, "CUR" => 5})   # => #<CurrencyConverter:0x007f85e48041b8 @rates_lookup={"USD"=>1.0, "EUR"=>0.74, "JPY"=>120.0, "CUR"=>5}>
currency_converter2 = CurrencyConverter.new({"USD" => 1.0, "EUR" => 0.8, "JPY" => 150.0, "CUR" => 4.9})  # => #<CurrencyConverter:0x007f85e6073aa0 @rates_lookup={"USD"=>1.0, "EUR"=>0.8, "JPY"=>150.0, "CUR"=>4.9}>

currency_converter1.convert(ten_dollars, "EUR")  # => #<Currency:0x007f85e6073438 @amount=7.4, @code="EUR">
currency_converter1.convert(one_eur, "CUR")      # => #<Currency:0x007f85e6072f10 @amount=6.756756756756757, @code="CUR">

currency_converter1.convert(Currency.new(1, "USD"), "USD") == Currency.new(1, "USD")  # => true

new_money = Currency.new("$5")  # => #<Currency:0x007f85e6071688 @amount="5", @code="USD">

start_value = Currency.new(1, "EUR")                               # => #<Currency:0x007f85e60710c0 @amount=1, @code="EUR">
converted_value = currency_converter1.convert(start_value, "EUR")  # => #<Currency:0x007f85e6070b98 @amount=1.0, @code="EUR">
currency_converter2.convert(converted_value, "EUR")                # => #<Currency:0x007f85e6070648 @amount=1.0, @code="EUR">

test_cur = Currency.new(0.74, "EUR")          # => #<Currency:0x007f85e6070148 @amount=0.74, @code="EUR">
currency_converter2.convert(test_cur, "USD")  # => #<Currency:0x007f85e606bc10 @amount=0.9249999999999999, @code="USD">

trader = CurrencyTrader.new(currency_converter1, currency_converter2, "EUR")  # => #<CurrencyTrader:0x007f85e606b6e8 @converter1=#<CurrencyConverter:0x007f85e48041b8 @rates_lookup={"USD"=>1.0, "EUR"=>0.74, "JPY"=>120.0, "CUR"=>5}>, @converter2=#<CurrencyConverter:0x007f85e6073aa0 @rates_lookup={"USD"=>1.0, "EUR"=>0.8, "JPY"=>150.0, "CUR"=>4.9}>, @start_currency="EUR">
trader.best_bet_currency                                                      # => ["CUR"]
