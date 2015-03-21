module Enumerable

  def my_each
    if self.class.name == "Hash"
      collection = self.to_a.flatten
    else
      collection = self
    end
    counter = 0
    while counter < collection.length
      yield collection[counter]
      counter += 1
    end
    self
  end

  def my_each_with_index
    if self.class.name == "Hash"
      collection = self.to_a.flatten
    else
      collection = self
    end
    counter = 0
    while counter < collection.length
      yield(collection[counter], counter)
      counter += 1
    end
    self
  end


end

if __FILE__ == $0
  puts "Testing my_each:"
  array = [1, 2, 3]
  array.my_each { |element| puts element }
  array.each { |element| puts element }

  hash = { first_name: "Sebastian", last_name: "Abondano" }
  hash.my_each { |element| puts element }
  hash.each { |element| puts element }


  puts "\nTesting my_each_with_index:"
  array = [1, 2, 3]
  array.my_each_with_index do |element, index|
    puts "#{index}: #{element}"
  end
  array.each_with_index do |element, index|
    puts "#{index}: #{element}"
  end

end
