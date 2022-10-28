class Guess
  def initialize(guess_attempt, secret_word)
    @guess = guess_attempt
    @secret_word = secret_word
  end

  def compare_words
    print_match
    matching_letters_amount / @guess.length
  end

  def matching_letters_amount
    @guess.chars.each_with_index.sum do |char, i|
      char == @secret_word[i] ? 1 : 0
    end
  end

  def print_match
    puts "#{matching_letters_amount}/#{@secret_word.length} correct"
  end
end
