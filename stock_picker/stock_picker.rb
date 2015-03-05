# Copyright (c) 2015 Sebastian Abondano
#
# This is an excercise (project) from The Odin Project
# (http://www.theodinproject.com/)
#
# Desciption:
# Implement a method #stock_picker that takes in an array of stock prices, one for each # hypothetical day. It should return a pair of days representing the best day to buy and # the best day to sell. Days start at 0.

class StockPicker
  attr_accessor :stock_prices, :options

  def initialize
    @stock_prices = []
    @options = {}
  end

  def stock_picker(stock_prices)
    @stock_prices = stock_prices
    generate_options
    select_best_option
  end

  def generate_options
    counter = 1
    @stock_prices.each do |price|
      start = @stock_prices.index(price) + 1
      finish = @stock_prices.size - 1
      for i in start..finish
        buy_day = price
        sell_day = @stock_prices[i]
        option = [buy_day, sell_day]
        profit = sell_day - buy_day
        @options["Option#{counter}"] = [option, profit]
        counter += 1
      end
    end
  end

  def select_best_option
    best_option = @options["Option1"]
    best_option_profit = best_option[1]
    @options.each do |key, value|
      if best_option_profit < value[1]
        best_option = @options[key]
        best_option_profit = best_option[1]
      end
    end
    final_answer = []
    final_answer << @stock_prices.index(best_option[0][0])
    final_answer << @stock_prices.index(best_option[0][1])
    puts "The best days to buy and sell are #{final_answer}."
  end
end


testing = StockPicker.new
testing.stock_picker([17,3,6,9,15,8,6,1,10])
