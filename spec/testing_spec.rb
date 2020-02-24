# frozen_string_literal: true

require './lib/validation.rb'
require './lib/grid.rb'

RSpec.describe Validation do

  describe '#move' do
    it 'returns true if grid value is numeric' do
      grid = Grid.new
      grid.grid[0] = 'X'
      validation = Validation.new
      expect(validation.move(0, grid)).to eql(false)
    end
  end

  describe '#inputs' do
    it 'returns true if grid value is numeric and positive and lower or iqual than 9' do
    grid = Grid.new
    grid.grid[0] = 'X'
    validation = Validation.new
    expect(validation.move(0, grid)).to eql(false)
    end
  end

  describe '#names' do
    it 'returns true when valid' do
      validation = Validation.new
      expect(validation.names('sala')).to eql(false)
    end
  end

  describe '#symbols' do
    it 'returns true when valid' do
      validation = Validation.new
      expect(validation.symbols('x')).to eql(true)
    end
  end
end
