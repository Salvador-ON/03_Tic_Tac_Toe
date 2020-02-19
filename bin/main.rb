# frozen_string_literal: true

# Class Game For Initialization of the Game
class Game
  attr_accessor :grid, :player1, :player2, :array_res
  def initialize(player1, player2, grid)
    @player1 = player1
    @player2 = player2
    @grid = grid
    @a_res = Array.new(3) { Array.new(2, 0) }
  end
  # rubocop: disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
  # rubocop: disable Metrics/MethodLength

  def conv_to_array
    k = 0
    t = 0
    @grid.grid.each do |n|
      if k.zero?
        @a_res[k][t] = n
        t += 1
        if t == 3
          k += 1
          t = 0
        end
      elsif k == 1
        @a_res[k][t] = n
        t += 1
        if t == 3
          k += 1
          t = 0
        end
      elsif k == 2
        @a_res[k][t] = n
        t += 1
        if t == 3
          k += 1
          t = 0
        end
      end
    end
  end

  def movements(player, num)
    @grid.grid[num - 1] = player.symbol
  end

  def playing?
    bool = true
    (0..2).each do |i|
      bool = false if (@a_res[i][0] == @a_res[i][1] && @a_res[i][0] == @a_res[i][2])
      bool = false if (@a_res[0][i] == @a_res[1][i] && @a_res[0][i] == @a_res[2][i])
      bool = false if (@a_res[0][0] == @a_res[1][1] && @a_res[0][0] == @a_res[2][2])
      bool = false if (@a_res[0][2] == @a_res[1][1] && @a_res[0][2] == @a_res[2][0])
    end
    bool = false if @grid.grid.none?(Numeric)
    bool
  end
  # rubocop: enable  Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
  # rubocop: enable Metrics/MethodLength

  def who_plays(player)
    temp = player
    temp = if player == @player1
      @player2
      else
      @player1
      end
    temp
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
  def move(input, grid)
    bool = if grid.grid[input].is_a?(Numeric)
             true
           else
             false
           end
    bool
  end
# rubocop:disable Metrics/MethodLength

  def inputs(input, grid)
    input = input.to_i
    bool = if (input <= 9) && input.positive?
             bool = if grid.grid[input - 1].is_a?(Numeric)
                      true
                    else
                      false
                    end
           else
             false
           end
    bool
  end
# rubocop:enable Metrics/MethodLength

  def names(name)
    bool = if name.strip.empty?
      true
    else
      false
    end
    bool
  end

  def symbols(symbol)
    array = %w[X O]
    bool = if array.any?(symbol)
            false
           else
            true
           end
    bool
  end
end

def validate_input(pos, grid, validator)
  validating = validator.inputs(pos, grid)
  until validating
    puts 'Invalid postion please reenter a correct position'
    pos = gets.chomp
    validating = validator.inputs(pos, grid)
  end
end

def turn(player, game, grid, validator)
  pos = gets.chomp
  validate_input(pos, grid, validator)
  game.movements(player, pos.to_i)
  game.conv_to_array
  who_play = game.who_plays(player)
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
validate_symbol = validator.symbols(xo)
while  validate_symbol
  puts 'Invalid value please reenter X or O'
  xo = gets.chomp
  xo = xo.upcase
  validate_symbol = validator.symbols(xo)
end
p1 = Players.new(name, xo)
ox = if xo == 'X'
       'O'
     else
       'x'
     end
puts 'Enter player 2 name'
name = gets.chomp
temp_bool = validator.names(name)
while temp_bool
  puts 'Invalid value please reenter a name'
  name = gets.chomp
  temp_bool = validator.names(name)
end
p2 = Players.new(name, ox)
game = Game.new(p1, p2, grid)
game.conv_to_array
temp_game = game.playing?
who_play = game.who_plays(p2)
while temp_game
  puts "#{who_play.name} make your move, in a available numeric space"
  puts grid.board
  who_play = turn(who_play, game, grid, validator)
  temp_game = game.playing?
end
