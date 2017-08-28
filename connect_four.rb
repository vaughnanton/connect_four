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
    horrizontals = "---+---+---+---+---+---+---"
  end

  def move(player)
  end

  def win_check(player)
  end

  def draw_check
  end

  def end_win(player)
  end

  def end_draw
  end

  def set_player
  end

  def play_again
  end

  def begin_game
  end

end

game = Game.new
game.begin_game()


end
