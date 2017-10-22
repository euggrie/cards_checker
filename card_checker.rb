require_relative 'spec/spec_helper'

class CardChecker
  attr_accessor :number

  def initialize(number)
    @number = number
  end

  def type
    arr = to_array(@number)

    case true
    when amex?(arr)
      return "AMEX"
    when discover?(arr)
      return "Discover"
    when mastercard?(arr)
      return "MasterCard"
    when visa?(arr)
      return "Visa"
    else "Unknown"
    end

  end

  def validate
    sum(@number) % 10 == 0 ? "Valid" : "Invalid"
  end

  private

  def to_array(input)
    input.split(" ").join("").split("").map(&:to_i)
  end

  def sum(number)
    arr = to_array(number).reverse
    double = arr.map!.with_index { |n, i| i.odd? ? n * 2 : n }
    double.reverse.join("").split("").map(&:to_i).inject(0, &:+)
  end

  def amex?(arr)
    return false unless arr[0] == 3 and [4, 7].include?(arr[1]) and arr.length == 15
    true
  end

  def discover?(arr)
    return false unless arr[0..3].join().to_i == 6011 and arr.length == 16
    true
  end

  def mastercard?(arr)
    return false unless [51, 52, 53, 54, 55].include?(arr[0..1].join().to_i) and arr.length == 16
    true
  end

  def visa?(arr)
    return false unless arr[0] == 4 and [13, 16].include?(arr.length)
    true
  end
end
