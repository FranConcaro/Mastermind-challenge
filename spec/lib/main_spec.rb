require 'main'
require 'rspec'

describe Main do
  let(:greeting_output) do
    "\n\n\n*********************************************************************\nHi! Welcome to Mastermind!\n\n"
  end
  let(:explanation_output) do
    "INSTRUCTIONS:\n\nYour goal is to find the “secret” word from a list of possible choices.\nYou will be given a list of words of the same length and be ask to pick one\nof the words from the provided list, for each guess.\nIf the correct word is guessed before you run out of guesses, YOU WIN!\n*********************************************************************\n\n\n"
  end
  context 'once the program is executed' do
    it 'should output the greeting to stdout' do
      main = described_class.new
      expect { main.send(:greeting) }.to output(greeting_output).to_stdout
    end

    it 'should output the explanation to stdout' do
      main = described_class.new
      expect { main.send(:explanation) }.to output(explanation_output).to_stdout
    end
  end
end
