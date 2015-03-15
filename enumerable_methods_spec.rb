require_relative 'enumerable_methods'

describe Enumerable do
  before do
    $stdout = StringIO.new
    @an_array = [1, 2, 3]
    @a_hash = { first_name: "Johny", last_name: "Rocket"}
  end

  it "has a #my_each method that works just like ruby's #each" do
    answer = []
    solution = []
    @an_array.my_each { |n| answer << n }
    @an_array.each { |n| solution << n }
    answer.should == solution
  end

end
