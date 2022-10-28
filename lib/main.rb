require_relative 'guess'
require_relative 'game_rules'
require_relative 'game_difficulty'
require_relative 'helper/general_methods'

class Main
  include GeneralMethods
  def start
    greeting
    explanation
    @game_difficulty = GameDifficulty.new(choose_difficulty?)
    difficulty = @game_difficulty.set_difficulty
    @game_rules = GameRules.new(difficulty)
    @game_rules.show_words_list
    make_guess
  end

  def make_guess
    current_attempt = 1
    while current_attempt <= total_attempts
      begin
        guess_attempt = process_attempt(total_attempts, current_attempt)
        result = Guess.new(guess_attempt, @game_rules.secret_word).compare_words
        win?(result)
        current_attempt += 1
      rescue StandardError => e
        print_error_message(e)
        retry
      end
    end
    you_lost
  end

  private

  def greeting
    puts ''
    puts ''
    puts ''
    puts '*********************************************************************'
    puts 'Hi! Welcome to Mastermind!'
    puts ''
  end

  def explanation
    puts 'INSTRUCTIONS:'
    puts ''
    puts "Your goal is to find the “secret” word from a list of possible choices.\nYou will be given a list of words of the same length and be ask to pick one\nof the words from the provided list, for each guess.\nIf the correct word is guessed before you run out of guesses, YOU WIN!"
    puts '*********************************************************************'
    puts ''
    puts ''
  end

  def win?(result)
    return unless result == 1

    print_message('CONGRATULATIONS! YOU WON!')
    Main.new.start if play_again?
    exit
  end

  def choose_difficulty?
    begin
      print_message("Would you like to choose the difficulty? It will randomize if you don't. (y/n)")

      choice = gets&.chomp&.downcase
      quit?(choice)
      valid_answer?(choice)
    rescue StandardError => e
      print_error_message(e)
      retry
    end
    OPTIONS[choice.to_sym]
  end

  def show_words_list
    @game_rules.show_words_list
  end

  def you_lost
    print_message("Bad luck! You have lost. The correct word was #{@game_rules.secret_word.upcase}.")
    Main.new.start if play_again?
  end

  def total_attempts
    @game_difficulty.attempts.to_i
  end

  def valid_guess(attempt)
    @game_rules.definitive_list.include?(attempt)
  end

  def process_attempt(total_attempts, current_attempt)
    attempts_left = total_attempts - current_attempt
    puts "Guess (#{attempts_left} left) ?"
    print '    $'
    guess_attempt = gets.chomp.downcase
    quit?(guess_attempt)
    raise 'Invalid guess. You must choose a word from the list' unless valid_guess(guess_attempt)

    guess_attempt
  end
end
