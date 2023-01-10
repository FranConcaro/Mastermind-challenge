require 'rspec'
require 'game_rules'

describe GameRules do
  let(:difficulty) { { words_amount: '5', words_length: '5' } }

  it 'returns filtered word list' do
    rules = described_class.new(difficulty)
    expect { rules.show_words_list }.to output(rules.definitive_list).to_stdout
  end
end
