require_relative "./currency"  # => true
require_relative "./different_currency_code_error"

ten_dollars = Currency.new(10, "USD")  # => #<Currency:0x007fe86c141868 @amount=10, @code="USD">
dix_dollars = Currency.new(20, "EUR")  # => #<Currency:0x007fe86c143de8 @amount=20, @code="EUR">

ten_dollars == dix_dollars  # => false

twenty_dollars = ten_dollars + dix_dollars  # ~> NameError: uninitialized constant Currency::DifferentCurrencyCodeError

# ~> NameError
# ~> uninitialized constant Currency::DifferentCurrencyCodeError
# ~>
# ~> /Users/aileenrowan/code/currency_converter_hw_rb/currency.rb:27:in `+'
# ~> /Users/aileenrowan/code/currency_converter_hw_rb/currency_playground.rb:8:in `<main>'
