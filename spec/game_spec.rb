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
end
