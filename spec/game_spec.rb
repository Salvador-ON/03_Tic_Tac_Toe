# frozen_string_literal: true

require './lib/game.rb'
require './lib/players.rb'
require './lib/grid.rb'

RSpec.describe Game do
  p1 = Players.new('p1', 'X')
  p2 = Players.new('p2', 'O')
  grid = Grid.new
  game = Game.new(p1, p2, grid)

  describe '#conv_to_array' do
    it 'returns true if grid = new array' do
      expect(game.conv_to_array.length == grid.grid.length).to eql(true)
    end
  end

  describe '#movements' do
    it 'Return true if movements hapen' do
      game.movements(p1, 1)
      expect(grid.grid[0] == 'X').to eql(true)
    end
  end

  describe '#win' do
    it 'Return True if p1 Won' do
      grid.grid = ['X', 'X', 'X', 4, 5, 6, 7, 8, 9]
      game.conv_to_array
      game.playing?
      expect(game.win == 'P1 Congratulation You Just WON ! ! !').to eql(true)
    end

    it 'Return True if p2 Won' do
      grid.grid = ['O', 'O', 'O', 4, 5, 6, 7, 8, 9]
      game.conv_to_array
      game.playing?
      expect(game.win == 'P2 Congratulation You Just WON ! ! !').to eql(true)
    end

    it 'Return True if no one Won' do
      # grid.grid = ['X', '0', 'O', 'O', 'X', 'X', 'X', 'X', 'O']
      # game.conv_to_array
      # puts game.conv_to_array.inspect
      # game.playing?
      game.a_r = nil
      expect(game.win == "You're All a Bunch of LOOSERS").to eql(true)
    end
  end
end
