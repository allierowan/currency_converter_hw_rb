# Currency Converter Homework

Contains classes to create currencies, convert them using input conversion rates, and determine the best bet for trading them over a certain time period.

## Currency Usage

### Create currencies
```ruby
currency = Currency.new(5, "USD") #(OR Currency.new("$5"))
currency.amount  #=> 5
currency.code  #=> "USD"
```
### Currency Addition, Subtraction, and Equality
Only currencies of the same code may be added or subtracted. If the code doesn't match, it will raise the DifferentCurrencyCodeError exception
```ruby
currency1 = Currency.new(50, "USD") #(OR Currency.new("$5"))
currency2 = Currency.new(40, "USD")

currency1 + currency2 == Currency.new(90, "USD") #=> true
currency1 - currency2 == Currency.new(10, "USD") #=> true
# currencies are only equal if their amounts AND codes are equal
currency3 = Currency.new(50, "EUR")
currency1 != currency3 #=> true

```
### Currency Multiplication
```ruby
# currencies may be multiplied by a float or int
currency = Currency.new(10, "USD")
currency*5 == Currency.new(50, "USD")

```
## CurrencyConverter Usage
### Create CurrencyConverter
```ruby
# a converter is initialized with a hash of rates
converter = CurrencyConverter.new({"USD" => 1.0, "EUR" => 0.74, "JPY" => 120.0})
converter.rates_lookup #=> {"USD" => 1.0, "EUR" => 0.74, "JPY" => 120.0}

```
### Convert currencies
Currencies can only be converted into one of the currencies that the converter knows about. If the code is not present in the hash, the UnknownCurrencyCodeError exception will be raised

```ruby
currency = Currency.new(1, "USD")
converter = CurrencyConverter.new({"USD" => 1.0, "EUR" => 0.74, "JPY" => 120.0})
converted_currency = converter.convert(currency, "EUR")
converted_currency.amount #=> 0.74
converted_currency.code #=> EUR
```

## CurrencyTrader Usage
The CurrencyTrader objects are initialized with two converters and a from-currency code. 
### Create CurrencyTrader
```ruby
converter1 = CurrencyConverter.new({"USD" => 1.0, "EUR" => 0.74, "JPY" => 120.0})
converter1 = CurrencyConverter.new({"USD" => 1.0, "EUR" => 0.50, "JPY" => 130.0})
currency_trader = CurrencyTrader.new(converter1, converter2, "USD")
```
### best_bet_currency Method
```ruby
# the best_bet_currency method determines which currency you should buy, given a start and end converter (point in time rates)
currency_trader.best_bet_currency #=> ["EUR"]
#returns an array in case there are multiple options
```
