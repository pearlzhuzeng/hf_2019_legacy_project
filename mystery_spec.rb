require 'rspec'
require_relative './mystery'

RSpec.describe 'mystery' do
  describe '#initialize' do
    it 'takes a text string and replaces - with empty spaces' do
      text = 'This is-a really really-beautiful word'
      expect(Mystery.new(text).text).to eq('This is a really really beautiful word')
    end
  end

  describe '#cleaned_words' do
    it 'returns a set of words' do
      text = 'hello-hello??-world'
      expect(Mystery.new(text).cleaned_words).to eq(['hello', 'hello', 'world'])
    end
  end

  describe '#counts' do
    it 'returns a word-count hash' do
      text = 'hello-hello??-world'
      expect(Mystery.new(text).counts).to eq({'hello' => 2, 'world' => 1})
    end
  end

  describe '#print' do
    it 'joins the word and count with dots to equal to the longest word length plus 3 dots' do
      text = 'hello hello hello world hello world world world world world world world world world'
      expect(Mystery.new(text).print).to eq(["hello....4", "world...10"])
    end
  end
end