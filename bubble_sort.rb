class BubbleSort
  attr_accessor :sorted_array

  def initialize
    @sorted_array = []
  end

  def bubble_sort(array)
    new_array = array
    no_swaps_flag = "down"
    until no_swaps_flag == "up"
      no_swaps_flag = "up"
      new_array.each_with_index do |number, index|
        if index < new_array.length - 1
          left = number
          right = new_array[index+1]
          if left > right
            new_array[index] = right
            new_array[index+1] = left
            no_swaps_flag = "down"
          end
        end
      end
    end
    @sorted_array = new_array
  end

  def bubble_sort_by(array)
    new_array = array
    no_swaps_flag = "down"

    until no_swaps_flag == "up"
      no_swaps_flag = "up"
      new_array.each_with_index do |element, index|
        if index < new_array.length - 1
          left = element
          right = new_array[index+1]
          if yield(left, right) < 0
            new_array[index] = right
            new_array[index+1] = left
            no_swaps_flag = "down"
          end
        end
      end
    end
    @sorted_array = new_array
  end

end

test_1 = BubbleSort.new
test_1.bubble_sort([4, 3, 78, 2, 0, 2])
print test_1.sorted_array

test_2 = BubbleSort.new
test_2.bubble_sort_by(["hi", "hello", "hey"]) do |left, right|
  right.length - left.length
end
print test_2.sorted_array
