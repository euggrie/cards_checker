#!/usr/bin/env ruby

require_relative('card_checker')

puts
puts "Enter your card number (Example: 4408 0412 3456 7893)"
puts

print "Number: "
number = gets.chomp

card = CardChecker.new(number)

puts
puts "Your card type is #{card.type}"
puts
puts "Your card is #{card.validate}"
puts
