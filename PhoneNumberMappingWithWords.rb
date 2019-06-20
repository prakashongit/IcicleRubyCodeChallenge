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
  return puts "Given number should not contain 0 or 1"
 end
 
 # check for it should be 10 digit number
 unless(number.to_s.length == 10)
  return puts "Given number should be less or greater than 10 digits"
 end
  
 # Get words from dictionary
 dictionary = File.open("dictionary.txt")
 dictionary_words = dictionary.readlines.map(&:strip).map(&:downcase)
 dictionary.close
 # end

 get_single_word(number, dictionary_words)
# get_two_words(number, dictionary)
# get_three_words(number, dictionary)

end

private

def get_single_word(number, dictionary_words)
 get_ten_letter_word = dictionary_words.select { |word| word.length == 10}
 (0..9).each do |index|
  get_ten_letter_word = get_ten_letter_word.select { |word| @@NumberMapping[number.to_s[index].to_i].include?(word[index]) } 
 end
 puts get_ten_letter_word
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
#phone_number_mapping_with_words.get_words_combinations(1233)
#phone_number_mapping_with_words.get_words_combinations(233)
#phone_number_mapping_with_words.get_words_combinations("asfasf")

phone_number_mapping_with_words.get_words_combinations(6686787825) #testing 10 letter word
