require 'rspec'
require_relative './mystery'

RSpec.describe 'mystery' do
  describe '#print' do
    it 'joins the word and count with dots to equal to the longest word length plus 3 dots' do
      word_counts = {
        'hello' => 4,
        'world' => 17
      }

      words = [
        'hello',
        'world'
      ]

      result = print(words, word_counts)
      expect(result).to eq(["hello....4", "world...17"])
    end
  end
end
