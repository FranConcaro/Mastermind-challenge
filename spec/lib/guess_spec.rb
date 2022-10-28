require 'rspec'
require 'guess'

describe Guess, '#match' do
  context 'once the guess is entered' do
    it 'returns the number of letters in the correct position as in the secret word.' do
      expect { described_class.new('train', 'brain').print_match }.to output("4/5 correct\n").to_stdout
    end
    it 'returns no letters in the correct position as in the secret word.' do
      expect { described_class.new('march', 'brain').print_match }.to output("0/5 correct\n").to_stdout
    end
  end
end
