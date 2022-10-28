require 'rspec'
require 'game_difficulty'

describe GameDifficulty do
  let(:words_length) { '5' }
  let(:words_amount) { '4' }
  let(:attempts) { '2' }
  context 'when user sets difficulty' do
    let(:game_difficulty) { GameDifficulty.new(true) }
    it 'sets @words_length' do
      game_difficulty.send(:set, { words_length: words_length })
      expect(game_difficulty.words_length).to eq(words_length)
    end
    it 'sets @words_amount' do
      game_difficulty.send(:set, { words_amount: words_amount })
      expect(game_difficulty.words_amount).to eq(words_amount)
    end
    it 'sets @attempts' do
      game_difficulty.send(:set, { attempts: attempts })
      expect(game_difficulty.attempts).to eq(attempts)
    end
  end

  context 'when user does not set difficulty' do
    let(:game_difficulty) { GameDifficulty.new(false) }
    it 'randomizes values' do
      game_difficulty.send(:randomize_difficulty)
      expect(game_difficulty.send(:valid_length, game_difficulty.words_length)).to eq(true)
      expect(game_difficulty.send(:valid_amount, game_difficulty.words_amount)).to eq(true)
      expect(game_difficulty.send(:valid_attempts_number, game_difficulty.attempts)).to eq(true)
    end
  end
end
