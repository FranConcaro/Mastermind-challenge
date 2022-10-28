require_relative 'constants/words_lists'

class GameRules
  include WordsLists
  attr_reader :secret_word, :definitive_list

  def initialize(array)
    @words_amount, @words_length = array
  end

  def show_words_list
    list = AVAILABLE_LISTS[@words_length.to_sym]
    @definitive_list = list.sample(@words_amount.to_i)
    @secret_word = @definitive_list.sample

    print_list_to_console
  end

  private

  def print_list_to_console
    puts 'Words List:'
    @definitive_list.each { |w| puts w.upcase unless w.nil? }
  end
end
