require_relative "./currency"                       # => true
require_relative "./different_currency_code_error"  # => true
require_relative "./currency_converter"             # => true

ten_dollars = Currency.new(10, "USD")     # => #<Currency:0x007f8ae28421b8 @amount=10, @code="USD">
thirty_dollars = Currency.new(30, "USD")  # => #<Currency:0x007f8ae2840e80 @amount=30, @code="USD">
one_eur = Currency.new(1, "EUR")          # => #<Currency:0x007f8ae2840908 @amount=1, @code="EUR">

thirty_dollars == ten_dollars  # => false

forty_dollars = ten_dollars + thirty_dollars  # => #<Currency:0x007f8ae283bef8 @amount=40, @code="USD">

twenty_dollars = thirty_dollars - ten_dollars  # => #<Currency:0x007f8ae283b958 @amount=20, @code="USD">

fifty_dollars = ten_dollars*5  # => #<Currency:0x007f8ae283b480 @amount=50, @code="USD">

currency_converter = CurrencyConverter.new({"USD" => 1.0, "EUR" => 0.74, "JPY" => 120.0})  # => #<CurrencyConverter:0x007f8ae283ae18 @rates_lookup={"USD"=>1.0, "EUR"=>0.74, "JPY"=>120.0}>

currency_converter.convert(ten_dollars, "EUR")  # => #<Currency:0x007f8ae283a3a0 @amount=7.4, @code="USD">
currency_converter.convert(one_eur, "JPY")      # => #<Currency:0x007f8ae2839888 @amount=162.16216216216216, @code="EUR">
