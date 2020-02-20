# frozen_string_literal: true

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
