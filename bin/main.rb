# frozen_string_literal: true

require_relative '../lib/game.rb'
require_relative '../lib/grid.rb'
require_relative '../lib/players.rb'
require_relative '../lib/validation.rb'

class Start
attr_accessor :p1, :p2, :game, :validator, :grid

def initialize
  @validator = Validation.new
  @grid = Grid.new
end

def validate_input(pos, @grid, @validator)
  validating = @validator.inputs(pos, @grid)
  until validating
    puts 'Invalid postion please reenter a correct position'
    pos = gets.chomp
    validating = @validator.inputs(pos, @grid)
  end
end

def turn(player, game, @grid, @validator)
  pos = gets.chomp
  validate_input(pos, @grid, @validator)
  game.movements(player, pos.to_i)
  game.conv_to_array
  who_play = game.who_plays(player)
  who_play
end

def ask_name(player)
  puts "Enter #{player} name"
  name = gets.chomp
  temp_bool = @validator.names(name)
  while temp_bool
    puts 'Invalid value please reenter a name'
    name = gets.chomp
    temp_bool = @validator.names(name)
  end
  name
end

def x_o
  puts 'What do you want to use X or O'
  xo = gets.chomp
  xo = xo.upcase
  validate_symbol = @validator.symbols(xo)
  while  validate_symbol
    puts 'Invalid value please reenter X or O'
    xo = gets.chomp
    xo = xo.upcase
    validate_symbol = @validator.symbols(xo)
  end
  xo
end

def select_x(xo)
  ox = if xo == 'X'
    'O'
  else
    'x'
  end
  ox
end

def player
  name = ask_name('Player 1')
  xo = x_o
  @p1 = Players.new(name, xo)
  ox = select_x(xo)
  name = ask_name('Player 2')
  @p2 = Players.new(name, ox)
end

def start
  puts "\e[H\e[2J"
  player
  game = Game.new(@p1, @p2, @grid)
  game.conv_to_array
  temp_game = game.playing?
  who_play = game.who_plays(p2)
  puts "\e[H\e[2J"
  while temp_game
    puts "#{who_play.name} make your move, in a available numeric space"
    puts @grid.board
    who_play = turn(who_play, game, @grid, @validator)
    temp_game = game.playing?
    puts "\e[H\e[2J"
  end
  puts "\e[H\e[2J"
  puts @grid.board
  puts ' '
  puts game.win
end

end

start


