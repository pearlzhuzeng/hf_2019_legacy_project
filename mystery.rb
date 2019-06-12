require 'pry'
require 'open-uri'
file = open('http://www.gutenberg.org/files/11/11-0.txt')
text = file.read

class Mystery
  MIN_NUMBER_OF_DOTS = 3

  attr_reader :text

  def initialize(text)
    @text = text.gsub(/-/, ' ')
  end

  def cleaned_words
    words = @text.split
    cleaned_words = []
    words.each do |word|
      word.gsub!(/[,\?\.‘’“”\:;!\(\)]/, '')
      cleaned_words << word.downcase
    end
    cleaned_words
  end

  def counts
    word_hash = {}
    cleaned_words.each do |word|
      if word_hash[word].nil?
        word_hash[word] = 0
      end
      word_hash[word] += 1
    end
    word_hash
  end

  def print
    longest_word = counts.keys.max_by(&:length)
    longest_length = longest_word.length + counts[longest_word].to_s.length + MIN_NUMBER_OF_DOTS
  
    counts.map do |word, count|
      puts [word, count]
      "#{word.ljust(longest_length - count.to_s.length + 1, '.')}#{count}"
    end
  end
end