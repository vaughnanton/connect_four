class Player

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  attr_reader :symbol
  attr_reader :name

end

class Game

  attr_accessor :board, :player1, :player2

  def initialize
    @board = [
      %w(_ _ _ _ _ _ _),
      %w(_ _ _ _ _ _ _),
      %w(_ _ _ _ _ _ _),
      %w(_ _ _ _ _ _ _),
      %w(_ _ _ _ _ _ _),
      %w(_ _ _ _ _ _ _),
      %w(1 2 3 4 5 6 7)]
    @turns = 1
  end

  def board
    puts "*** Connect-Four ***"
    @board.each { |row| puts " " + row.join(" ") }
  end

  def get_answer
    gets.chomp
  end

  def begin_game
    puts "Welcome to Connect-Four! The goal of the game is to connect 4 pieces in any orientation on the 6x7 playing grid. Player 1 - ○, please input your name:"
    @player1 = get_answer
    puts "Player 2, ●, please input your name:"
    @player2 = get_answer
    board
    loop
  end

  def end_game(player)
    puts "#{player} won the game! Play again? (Y/N)"
    answer = get_answer.upcase
    answer == "Y" ? restart_game : exit
  end

  def restart_game
    @board = [
     %w(_ _ _ _ _ _ _),
     %w(_ _ _ _ _ _ _),
     %w(_ _ _ _ _ _ _),
     %w(_ _ _ _ _ _ _),
     %w(_ _ _ _ _ _ _),
     %w(_ _ _ _ _ _ _),
     %w(1 2 3 4 5 6 7)]
   @turns = 1
   puts "Restart!"; board
   loop
 end

  def loop
    until winning_condition?
      player = @turns.odd ? @player1 : @player2
      puts "#{player}, in which column do you want to drop your piece?"
      answer = get_answer.to_i
      valid_move?(answer, player) ? make_move(answer, player) : (p 'Error, try again': loop)
    end
  end_game(player)
  end

  def valid_move(answer, _player)
    (answer.between?(1,7) && @board[0][answer-1] == '_') ? true : false
  end

  def make_move(column, player)
    color = player == @player1 ? "○" : "●"
    modify_board(color,column)
    puts "#{player} placed #{color} in column #{column}"
    @turns += 1
    board
  end

  def modify_board(color, column)
    piece_placed = false
    index = 0
    array = @board.collect { |row| row[column - 1] }
    array.pop; array.reverse!
    until piece_placed
      if array[index] == "_"
        @board[@board.length - (index + 2)][column - 1] = color
        piece_placed = true
      end
      index += 1
    end
  end

  def winning_condition?
    horizontal? || vertical? || diagonal? || reverse_diagonal? ? true : false
  end

  def four_connected?
  end

  def horizontal?
  end

  def vertical?

  end

  def diagonal?
  end

  def reverse_diagonal?
  end

end

game = Game.new
game.begin_game()
