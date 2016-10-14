require_relative "./currency"  # => true

ten_dollars = Currency.new(10, "USD")  # => #<Currency:0x007fb24391c308 @amount=10, @currency_code="USD">
dix_dollars = Currency.new(20, "USD")  # => #<Currency:0x007fb24391cbc8 @amount=10, @currency_code="USD">

ten_dollars == dix_dollars  # => true
