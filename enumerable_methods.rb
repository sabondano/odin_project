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


end

if __FILE__ == $0
  array = [1, 2, 3]
  array.my_each { |element| puts element }
  array.each { |element| puts element }

  hash = { first_name: "Sebastian", last_name: "Abondano" }
  hash.my_each { |element| puts element }
  hash.each { |element| puts element }
end
