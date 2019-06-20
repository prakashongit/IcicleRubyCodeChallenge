class PhoneNumberMappingWithWords

@@NumberMapping = {
2 => ['a', 'b', 'c'],
3 => ['d', 'e', 'f'], 
4 => ['g', 'h', 'i'],
5 => ['j', 'k', 'l'],
6 => ['m', 'n', 'o'],
7 => ['p', 'q', 'r', 's'],
8 => ['t', 'u', 'v'],
9 => ['w', 'x', 'y', 'z']
}

def get_words_combinations(number)
 # check for give input should be number
 unless(number.class == Fixnum)
  return puts "please give 10 digit number"
 end

 # check for number should not contain 0 or 1
 if(number.to_s.include?("0") || number.to_s.include?("1"))
  return puts "Error: Should not contain 0 or 1"
 end
  
 # Get words from dictionary
 dictionary = File.open("dictionary.txt")
 dictionary_words = dictionary.readlines.map(&:strip)
 dictionary.close
 # end

 get_single_word(number)
 get_two_words(number)
 get_two_words(number)
 get_two_words(number)
 get_three_words(number)

end

private

def get_single_word(number)
 puts 'one word'
end

def get_two_words(number)
 puts 'two words'
end

def get_three_words(number)
 puts 'three words'
end

end

# Testing
phone_number_mapping_with_words =  PhoneNumberMappingWithWords.new
phone_number_mapping_with_words.get_words_combinations(123)
phone_number_mapping_with_words.get_words_combinations("asfasf")
