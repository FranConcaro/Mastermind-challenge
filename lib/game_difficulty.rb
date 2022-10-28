require_relative 'helper/general_methods'

class GameDifficulty
  include GeneralMethods
  attr_accessor :words_amount, :words_length, :attempts

  def initialize(choice)
    @custom_difficulty = choice
  end

  def set_difficulty
    return randomize_difficulty unless @custom_difficulty

    choose_difficulty

    output
  end

  private

  def choose_difficulty
    choose_words_length
    choose_words_amount
    choose_attempts_number
  end

  def choose_words_length
    print_message('Choose the length of the words: (4,5,6,7,8)')
    words_length = gets.chomp
    quit?(words_length)
    raise 'Invalid input. Please choose a number from the options.' unless valid_length(words_length)

    set({ words_length: words_length })
  rescue StandardError => e
    print_error_message(e)
    retry
  end

  def valid_length(words_length)
    %w[4 5 6 7 8].include?(words_length)
  end

  def choose_words_amount
    print_message('Choose an amount of words from 2 to 30.')
    words_amount = gets.chomp
    quit?(words_amount)
    raise 'Invalid input. Please choose a number within the given range.' unless valid_amount(words_amount)

    set({ words_amount: words_amount })
  rescue StandardError => e
    print_error_message(e)
    retry
  end

  def valid_amount(words_amount)
    (2..30).include?(words_amount.to_i)
  end

  def choose_attempts_number
    print_message('Choose a number of attempts. Remember it cannot be 0 or more than half the number of words.')
    attempts = gets.chomp
    quit?(attempts)
    raise 'Invalid input. Please choose a valid number.' unless valid_attempts_number(attempts)

    set({ attempts: attempts })
  rescue StandardError => e
    print_error_message(e)
    retry
  end

  def valid_attempts_number(attempts)
    (1..@words_amount.to_i / 2).include?(attempts.to_i)
  end

  def randomize_difficulty
    @words_length = %w[4 5 6 7 8].sample
    @words_amount = rand(2..30)
    @attempts = rand(1..@words_amount.to_i / 2)

    output
  end

  def output
    { words_amount: @words_amount, words_length: @words_length }
  end

  def set(hash)
    instance_variable_set("@#{hash.keys.first}", hash.values.first)
  end
end
