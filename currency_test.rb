require_relative "./currency"
require "minitest/autorun"
require "minitest/pride"

class CurrencyTest < Minitest::Test

  def one_usd
    ::Currency.new(1, "USD")
  end
  
  def test_equals
    one_dolla = one_usd
    assert_equal one_usd, one_dolla
  end

  def test_equals_symbol
    one_dolla = Currency.new("$1")
    assert_equal one_dolla, one_usd
  end

  def test_code_not_equal
    one_eur = Currency.new(1, "EUR")
    refute_equal one_usd, one_eur
  end

  def test_amt_not_equal
    two_usd = Currency.new(2, "USD")
    refute_equal one_usd, two_usd, "two unequal currencies are equal"
  end

  def test_add
    one_eur = Currency.new(1, "EUR")
    two_eur = Currency.new(2, "EUR")
    assert_equal one_eur + one_eur, two_eur
  end

  def test_subtract
    one_eur = Currency.new(1, "EUR")
    two_eur = Currency.new(2, "EUR")
    assert_equal two_eur - one_eur, one_eur
  end

  def test_multiply
    one_eur = Currency.new(1, "EUR")
    five_eur = Currency.new(5, "EUR")
    assert_equal one_eur * 5, five_eur
  end

end
