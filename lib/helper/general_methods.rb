module GeneralMethods
  OPTIONS = { y: true, n: false }.freeze

  def print_message(message)
    puts '*********************************************************************'
    puts message
    puts '*********************************************************************'
  end

  def print_error_message(error)
    puts '*********************************************************************'
    puts 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
    puts ''
    puts error
    puts ''
    puts 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
  end

  def quit?(input)
    case input
    when 'q'
      puts 'Until next time!'
      exit
    when nil
      if confirmed_exit
        puts 'Until next time!'
        exit
      end
    end
  end

  def confirmed_exit
    print_error_message('Are you sure you want to quit? (y/n)')
    choice = gets&.chomp
    valid_answer?(choice)
    OPTIONS[choice.to_sym]
  rescue StandardError => e
    print_error_message(e)
    retry
  end

  def play_again?
    puts('Do you want to play again? (y/n)')
    choice = gets&.chomp
    valid_answer?(choice)
    OPTIONS[choice.to_sym]
  rescue StandardError => e
    print_error_message(e)
    retry
  end

  def valid_answer?(choice)
    raise 'Invalid option. Please type "y" or "n".' unless %w[y n].include?(choice)
  end
end
