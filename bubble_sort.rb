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
end

test = BubbleSort.new
test.bubble_sort([4, 3, 78, 2, 0, 2])
print test.sorted_array
