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
 get_two_words(number, dictionary_words)
 get_three_words(number, dictionary_words)

end

private

def get_single_word(number, dictionary_words)
 get_ten_letter_word = dictionary_words.select { |word| word.length == 10}
 (0..9).each do |index|
  get_ten_letter_word = get_ten_letter_word.select { |word| @@NumberMapping[number.to_s[index].to_i].include?(word[index]) } 
 end
 puts get_ten_letter_word
end

def get_two_words(number, dictionary_words)
 get_four_letter_word = dictionary_words.select { |word| word.length == 4}
 get_four_letter_word2 = dictionary_words.select { |word| word.length == 4}
 get_five_letter_word1 = dictionary_words.select { |word| word.length == 5}
 get_five_letter_word2 = dictionary_words.select { |word| word.length == 5}
 get_six_letter_word = dictionary_words.select { |word| word.length == 6}
 get_six_letter_word2 = dictionary_words.select { |word| word.length == 6}

 (0..9).each do |index|
  if(index < 4)
   get_four_letter_word = get_four_letter_word.select { |word| @@NumberMapping[number.to_s[index].to_i].include?(word[index]) }
  else
   get_six_letter_word = get_six_letter_word.select { |word| @@NumberMapping[number.to_s[index].to_i].include?(word[index-4]) }
  end
end
 
 (0..9).each do |index|
  if(index < 5)
   get_five_letter_word1 = get_five_letter_word1.select { |word| @@NumberMapping[number.to_s[index].to_i].include?(word[index]) }
  else
   get_five_letter_word2 = get_five_letter_word2.select { |word| @@NumberMapping[number.to_s[index].to_i].include?(word[index-5]) }
  end
 end

 if(get_four_letter_word.length > 0)
   (0...get_six_letter_word.length).each do |index|
    puts  get_four_letter_word[0] + ", " +  get_six_letter_word[index]
   end
 end

 if(get_five_letter_word1.length > 0)
   (0...get_five_letter_word2.length).each do |index|
     puts get_five_letter_word1[0] + ", " +  get_five_letter_word2[index]
   end
 end

 
 (0..9).each do |index|
  if(index < 6)
   get_six_letter_word2 = get_six_letter_word2.select { |word| @@NumberMapping[number.to_s[index].to_i].include?(word[index]) }
  else
    get_four_letter_word2 =  get_four_letter_word2.select { |word| @@NumberMapping[number.to_s[index].to_i].include?(word[index-6]) }
  end
 end

 if(get_four_letter_word2.length > 0)
   (0...get_six_letter_word2.length).each do |index|
    puts get_six_letter_word2[0] + ", " +  get_four_letter_word2[index]
   end
 end

 get_three_letter_word = dictionary_words.select { |word| word.length == 3}
 get_seven_letter_word = dictionary_words.select { |word| word.length == 7}
 
 (0..9).each do |index|
  if(index < 3)
   get_three_letter_word = get_three_letter_word.select { |word| @@NumberMapping[number.to_s[index].to_i].include?(word[index]) }
  else
    get_seven_letter_word =  get_seven_letter_word.select { |word| @@NumberMapping[number.to_s[index].to_i].include?(word[index-3]) }
  end
 end
 
 if(get_three_letter_word.length > 0)
   (0... get_seven_letter_word.length).each do |index|
    puts get_three_letter_word[0] + ", " +   get_seven_letter_word[index]
   end
 end
end

def get_three_words(number, dictionary_words)
 get_three_letter_word1 = dictionary_words.select { |word| word.length == 3}
 get_three_letter_word2 = dictionary_words.select { |word| word.length == 3}
 get_four_letter_word = dictionary_words.select { |word| word.length == 4}

 (0..9).each do |index|
  if(index < 3)
   get_three_letter_word1 = get_three_letter_word1.select { |word| @@NumberMapping[number.to_s[index].to_i].include?(word[index]) }
  elsif(index < 6)
   get_three_letter_word2 = get_three_letter_word2.select { |word| @@NumberMapping[number.to_s[index].to_i].include?(word[index-3]) }
  else
   get_four_letter_word = get_four_letter_word.select { |word| @@NumberMapping[number.to_s[index].to_i].include?(word[index-6]) }
  end
 end
 puts  get_three_letter_word1[0] + ", " +  get_three_letter_word2[0] + ", " +  get_four_letter_word[0]

 get_three_letter_word1 = dictionary_words.select { |word| word.length == 3}
 get_three_letter_word2 = dictionary_words.select { |word| word.length == 3}
 get_four_letter_word = dictionary_words.select { |word| word.length == 4}

 (0..9).each do |index|
  if(index < 3)
   get_three_letter_word1 = get_three_letter_word1.select { |word| @@NumberMapping[number.to_s[index].to_i].include?(word[index]) }
  elsif(index < 7)
   get_four_letter_word = get_four_letter_word.select { |word| @@NumberMapping[number.to_s[index].to_i].include?(word[index-3]) }
  else
    get_three_letter_word2 = get_three_letter_word2.select { |word| @@NumberMapping[number.to_s[index].to_i].include?(word[index-7]) }
  end
 end
 puts  get_three_letter_word1[0] + ", " +  get_four_letter_word[0] + ", " +  get_three_letter_word2[0] 
end
end

# Testing
phone_number_mapping_with_words =  PhoneNumberMappingWithWords.new
#phone_number_mapping_with_words.get_words_combinations(1233)
#phone_number_mapping_with_words.get_words_combinations(233)
#phone_number_mapping_with_words.get_words_combinations("asfasf")

#phone_number_mapping_with_words.get_words_combinations(6686787825) #testing 10 letter word
#phone_number_mapping_with_words.get_words_combinations(6686787825)
phone_number_mapping_with_words.get_words_combinations(2282668687)



