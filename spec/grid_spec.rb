# frozen_string_literal: true

require './lib/grid.rb'

RSpec.describe Grid do
  describe '#grid' do
    it 'returns true if grid value is default' do
      grid = Grid.new
      expect(grid.grid == [1, 2, 3, 4, 5, 6, 7, 8, 9]).to eql(true)
    end
  end
end
