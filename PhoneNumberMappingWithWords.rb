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

 # Assignment based on combinations
 get_ten_letter_words = dictionary_words.select { |word| word.length == 10}

 get_first_seven_letter_words = dictionary_words.select { |word| word.length == 7} 
 get_second_seven_letter_words = dictionary_words.select { |word| word.length == 7}

 get_first_six_letter_words = dictionary_words.select { |word| word.length == 6}
 get_second_six_letter_words = dictionary_words.select { |word| word.length == 6}

 get_first_five_letter_words = dictionary_words.select { |word| word.length == 6}
 get_second_five_letter_words = dictionary_words.select { |word| word.length == 6}

 get_first_four_letter_words = dictionary_words.select { |word| word.length == 4}
 get_middle_four_letter_words = dictionary_words.select { |word| word.length == 4}
 get_last_four_letter_words = dictionary_words.select { |word| word.length == 4}

 get_first_three_letter_words = dictionary_words.select { |word| word.length == 3}
 get_middle_three_letter_words = dictionary_words.select { |word| word.length == 3}
 get_last_three_letter_words = dictionary_words.select { |word| word.length == 3}

 (0..9).each do |index|
  get_ten_letter_words = common_code_get_result(get_ten_letter_words, number.to_s[index].to_i, index)
 
  if(index < 7)
   get_first_seven_letter_words = common_code_get_result(get_first_seven_letter_words, number.to_s[index].to_i, index)
  else
   get_last_three_letter_words = common_code_get_result(get_last_three_letter_words, number.to_s[index].to_i, index-7)
  end
 
  if(index < 6)
    get_first_six_letter_words = common_code_get_result(get_first_six_letter_words, number.to_s[index].to_i, index)
  else
    get_last_four_letter_words = common_code_get_result(get_last_four_letter_words, number.to_s[index].to_i, index-6)
  end
 
  if(index < 5)
    get_first_five_letter_words = common_code_get_result(get_first_five_letter_words, number.to_s[index].to_i, index)
  else
   get_second_five_letter_words = common_code_get_result(get_second_five_letter_words, number.to_s[index].to_i, index-5)
  end

  if(index < 4)
    get_first_four_letter_words = common_code_get_result(get_first_four_letter_words, number.to_s[index].to_i, index)
  else
    get_second_six_letter_words = common_code_get_result(get_second_six_letter_words, number.to_s[index].to_i, index-4)
  end
 
  if(index < 3)
   get_first_three_letter_words = common_code_get_result(get_first_three_letter_words, number.to_s[index].to_i, index)
  else
    if(index < 6)
      get_middle_three_letter_words = common_code_get_result( get_middle_three_letter_words, number.to_s[index].to_i, index-3)
    end
    get_second_seven_letter_words = common_code_get_result(get_second_seven_letter_words, number.to_s[index].to_i, index-3)
  end
 end

result = []
# Single 10 letter word
result << get_ten_letter_words

# Two words combination
result << get_two_words(get_first_seven_letter_words, get_last_three_letter_words)
result << get_two_words(get_last_three_letter_words, get_second_seven_letter_words)

result << get_two_words(get_first_six_letter_words, get_last_four_letter_words)
result << get_two_words(get_first_four_letter_words, get_second_six_letter_words)

result << get_two_words(get_first_five_letter_words, get_second_five_letter_words)

# Three words combination
result << get_three_words(get_first_three_letter_words, get_middle_three_letter_words, get_last_four_letter_words)
result << get_three_words(get_first_three_letter_words,  get_middle_four_letter_words, get_last_three_letter_words)
result << get_three_words(get_first_four_letter_words, get_middle_three_letter_words, get_last_three_letter_words)

puts result
end

private

def common_code_get_result(words, digit, index)
 words.select { |word| @@NumberMapping[digit].include?(word[index]) }
end

def get_two_words(first_words, last_words)
 two_words_result = []
 if(first_words.length > 0)
   (0...last_words.length).each do |index|
      two_words_result << first_words[0] + ", " +  last_words[index]
   end
 end

 ###
 # uncomment below code for more combinations
 ###
 #if(last_words.length > 0)
  # (0...first_words.length).each do |index|
   #   two_words_result << first_words[index] + ", " +  last_words[0]
   #end
 #end

 two_words_result
end

def get_three_words(first_words, middle_words, last_words)
three_words_result = []
 if(first_words.length > 0 && middle_words.length > 0)
   (0...last_words.length).each do |index|
      three_words_result << first_words[0] + "," + middle_words[0] + ", " +  last_words[index]
   end
 end
 
 ###
 # uncomment below code for more combinations
 ###
 #if(last_words.length > 0 && middle_words.length > 0)
   #(0...middle_words.length).each do |index|
    #  three_words_result << first_words[0] + "," + middle_words[index] + ", " +  last_words[0]
   #end
 #end
 #if(first_words.length > 0 && last_words.length > 0)
   #(0...first_words.length).each do |index|
      #three_words_result << first_words[index] + "," + middle_words[0] + ", " +  last_words[0]
   #end
 #end
three_words_result
end
end

# Testing
phone_number_mapping_with_words =  PhoneNumberMappingWithWords.new
#phone_number_mapping_with_words.get_words_combinations(1233)
#phone_number_mapping_with_words.get_words_combinations(233)
#phone_number_mapping_with_words.get_words_combinations("asfasf")

#phone_number_mapping_with_words.get_words_combinations(6686787825) #testing 10 letter word
phone_number_mapping_with_words.get_words_combinations(6686787825)
#phone_number_mapping_with_words.get_words_combinations(2282668687)



