class Substrings

  def initialize
    @hash_of_substrings = Hash.new(0)
  end

  def substrings(strings, dictionary)
    strings_array = strings.downcase.scan(/[\w']+/)
    dictionary.each do |word|
      strings_array.each do |search_term|
        if search_term == word
          @hash_of_substrings[search_term] += 1
        end
      end
    end
    puts @hash_of_substrings
  end

end

test = Substrings.new

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

test.substrings("Howdy partner, sit down! How's it going?", dictionary)
