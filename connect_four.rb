class Cell

  def initialize
    @value = nil
  end

  def value
    return " " if @value == nil
  end

  def set(player)
    unless value == " "
      puts "Error"
      return false
    end
    @value = player.symbol
  end

end

class Player

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  attr_reader :symbol
  attr_reader :name

end

class Game

  def initialize
    @players = set_player
    @game_over = false
  end

  attr_reader :players
  attr_reader :cells
  attr_accessor :game_over

  def board
    board = [
      %w(_ _ _ _ _ _ _),
      %w(_ _ _ _ _ _ _),
      %w(_ _ _ _ _ _ _),
      %w(_ _ _ _ _ _ _),
      %w(_ _ _ _ _ _ _),
      %w(_ _ _ _ _ _ _),
      %w(1 2 3 4 5 6 7)]
    puts board
  end

  def get_answer
    gets.chomp
  end

  def begin_game
    puts "Welcome to Connect-Four! The goal of the game is to connect 4 pieces in any orientation on the 6x7 playing grid. Player 1 - \u+25E6, please input your name:"
    @player1 = get_answer
    puts "Player 2, \u+25CF, please input your name:"
    @player2 = get_answer
    board FINISH
    loop_game
  end

  def end_game(player)
    puts "#{player} won the game! Play again? (Y/N)"
    answer = get_answer.upcase
    answer == "Y" ? restart_game : exit
  end

  def restart_game
    board = [
     %w(_ _ _ _ _ _ _),
     %w(_ _ _ _ _ _ _),
     %w(_ _ _ _ _ _ _),
     %w(_ _ _ _ _ _ _),
     %w(_ _ _ _ _ _ _),
     %w(_ _ _ _ _ _ _),
     %w(1 2 3 4 5 6 7)]
   @turns = 1
   puts "Game restarted!"; board
   loop_game
 end

  def loop_game
    until winning_condition?
      player = @turns.odd ? @player1 : @player2
      puts "#{player}, in which column do you want to drop your piece?"
      answer = get_answer.to_i
      valid_move?(answer, player) ? make_move(answer, player) : (p 'Error, try again': loop_game)
    end
  end_game(player)
  end

  #------------------- making moves --------------------------

  def valid_move(answer, _player)
    (answer.between?(1,7) && @board[0][answer-1] == '_') ? true : false
  end

  def make_move(column, player)
    color = player == @player1 ? ""
end

game = Game.new
game.begin_game()


end
