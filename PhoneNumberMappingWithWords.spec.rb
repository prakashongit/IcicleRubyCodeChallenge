require 'rspec/autorun'
require_relative 'PhoneNumberMappingWithWords.rb'

describe PhoneNumberMappingWithWords do
  it "get phone number to words" do
    test = PhoneNumberMappingWithWords.new
    expect( test.get_words_combinations(6686787825).length).to satisfy{ |value| value > 5 }
  end
end

describe PhoneNumberMappingWithWords do
  it "get phone number to words" do
    test = PhoneNumberMappingWithWords.new
    expect( test.get_words_combinations(6686787824).length).to satisfy{ |value| value > 5 }
  end
end
