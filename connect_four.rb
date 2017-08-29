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
    horizontal? || vertical? || diagonal? || anti_diagonal? ? true : false
  end

  def four_connected?
    true if (array[index..index+3].all?{|color| color == "○"} || array[index..index+3].all?{|color| color == "●"})
  end

  def horizontal?
    6.times do |row|
      array = @board[row]
      4.times { |index| four_connected? (array, index) ? (return true) : next }
    end
    false
  end

  def vertical?
    6.times do |index|
      array = @board.collect { |row| row[index] }
      array.pop;
      3.times { |index| four_connected?(array, index) ? (return true) : next }
    end
    false
  end

  def diagonal?(board = @board, collection = [])
    diagonal_length, row, position = 4, 2, 0
    until collection.length == 6
      array = []
      diagonal_length.times { |index| array << board[index + row][index + position] }
      collection << array
      case collection.length
      when 0...3 then row -= 1; diagonal_length += 1
      when 3 then position += 1
      when 4..6 then diagonal_length -= 1; position += 1
      end
    end
    collection.each do |diagonal|
      diagonal.length.divmod(4).inject(0, :+).times { |index| four_connected?(diagonal, index) ? (return true) : false }
    end
    false
  end

  def anti_diagonal?
    board = @board.reverse; board.shift
    diagonal?(board)
  end

end

game = Game.new
game.begin_game()


end
