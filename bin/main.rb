# frozen_string_literal: true

# Class Game For Initialization of the Game
class Game
  attr_accessor :grid, :player1, :player2
  def initialize(player1, player2, grid)
    @player1 = player1
    @player2 = player2
    @grid = grid
  end

  def movements(player, num)
    @grid.grid[num - 1] = player.symbol
  end

  def playing?
    bool = true
    bool = false if @grid.grid.none?(Numeric) 
    bool
  end

  def who_plays(player)
    if player == @player1
      return @player2
    else
      return @player1
    end
  end
end

# Grid Class Create the Map of the Game
class Grid
  attr_accessor :grid
  def initialize
    @grid = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def board
    res = " #{@grid [0]} | #{@grid [1]} | #{@grid [2]}\n-----------\n "
    res += "#{@grid [3]} | #{@grid [4]} | #{@grid [5]}\n-----------\n "
    res += "#{@grid [6]} | #{@grid [7]} | #{@grid [8]}"
    res
  end
end

# Player Init a Player
class Players
  attr_accessor :name, :symbol
  def initialize(name, symbol)
    @name = name.capitalize
    @symbol = symbol.capitalize
  end
end

# Validation of Variables
class Validation
  def move(input,grid)
    bool = if grid.grid[input].is_a?(Numeric)
             true
           else
             false
           end
    bool
  end
  def inputs(input)
    bool = if (input <= 9) && (input > 0) && !(input.any?(' '))
             bool = true
           else
             bool = false
           end
    bool
  end
  def names(name)
    name.strip.empty? ? bool = true : bool = false
    bool
  end
  def symbols(symbol)
    array = ['X', 'O']
    symbol.any?(array) ? bool = true : bool = false
    bool
  end
end

def turn(player,game,grid)
  who_play = game.who_plays(player)
  puts "#{who_play.name} make your move, in a available numeric space"
  puts grid.board
  pos = gets.chomp
  game.movements(who_play, pos.to_i)
  who_play
end

validator = Validation.new
grid = Grid.new
puts 'Enter player 1 name'
name = gets.chomp
temp_bool = validator.names(name)
while temp_bool
  puts 'Invalid value please reenter a name'
  name = gets.chomp
  temp_bool = validator.names(name)
end
puts 'What do you want to use X or O'
xo = gets.chomp
xo = xo.upcase
p1 = Players.new(name, xo)
ox = if xo == 'X'
       'O'
     else
       'x'
     end
puts 'Enter player 2 name'
name = gets.chomp
p2 = Players.new(name, ox)
game = Game.new(p1, p2, grid)
puts grid.board
temp_game = game.playing?
puts "#{p1.name} make your firts move"
pos = gets.chomp
who_play = game.who_plays(p2)
game.movements(p1, pos.to_i)
while temp_game
  who_play = turn(who_play,game,grid)
  temp_game = game.playing?
end


