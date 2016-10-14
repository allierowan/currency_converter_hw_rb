require_relative "./currency"                       # => true
require_relative "./different_currency_code_error"  # => true

ten_dollars = Currency.new(10, "USD")     # => #<Currency:0x007fe13789ab28 @amount=10, @code="USD">
thirty_dollars = Currency.new(30, "USD")  # => #<Currency:0x007fe13789a588 @amount=30, @code="EUR">

thirty_dollars == ten_dollars  # => false

forty_dollars = ten_dollars + thirty_dollars  # ~> DifferentCurrencyCodeError: currency codes are different

twenty_dollars = thirty_dollars - ten_dollars  # ~> DifferentCurrencyCodeError: currency codes are different

# ~> DifferentCurrencyCodeError
# ~> currency codes are different
# ~>
# ~> /Users/aileenrowan/code/currency_converter_hw_rb/currency.rb:35:in `-'
# ~> /Users/aileenrowan/code/currency_converter_hw_rb/currency_playground.rb:11:in `<main>'
