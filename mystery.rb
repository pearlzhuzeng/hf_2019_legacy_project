require 'open-uri'
file = open('http://www.gutenberg.org/files/11/11-0.txt')
text = file.read

text.gsub!(/-/, ' ')

words = text.split

cleaned_words = []

words.each do |word|
  word.gsub!(/[,\?\.‘’“”\:;!\(\)]/, '')
  cleaned_words << word.downcase
end

words = cleaned_words
words.sort!

word_hash = {}

words.each do |word|
  if word_hash[word].nil?
    word_hash[word] = 0
  end
  word_hash[word] += 1
end

word_hash = word_hash.sort_by { |word, count| count }.to_h

MIN_NUMBER_OF_DOTS = 3

def print(words, word_counts)
  longest_word = words.max_by(&:length)
  longest_length = longest_word.length + word_counts[longest_word].to_s.length + MIN_NUMBER_OF_DOTS

  words.map do |word|
    count = word_counts[word]
    "#{word.ljust(longest_length - count.to_s.length + 1, '.')}#{count}"
  end
end