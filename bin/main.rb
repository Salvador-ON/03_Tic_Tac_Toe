class Game
  attr_accessor :grid, :player1, :player2
  def initialize(player1, player2, grid)
    @player1 = player1
    @player2 = player2
    @grid = grid
  end

  def movements (player, num)
    @grid.grid[num - 1] = player.symbol
  end
end

class Grid
  attr_accessor :grid
  def initialize()
    @grid = [1, 2, 3 , 4, 5, 6, 7, 8, 9]
    end

  def board
    res = " #{ @grid [0]} | #{ @grid [1]} | #{ @grid [2]}\n-----------\n #{ @grid [3]} | #{ @grid [4]} | #{ @grid [5]}\n-----------\n #{ @grid [6]} | #{ @grid [7]} | #{ @grid [8]}"
      return res
      end
  end

    class Players
        attr_accessor :name, :symbol
        def initialize(name,symbol)
            @name = name.capitalize
            @symbol = symbol.capitalize
        end
    end

    


grid = Grid.new()
puts 'Enter player 1 name'
name=gets.chomp
puts 'What do you want to use X or O'
xo=gets.chomp
p1 = Players.new(name, xo)
if xo == 'x' || xo == 'X' 
  xo = 'O'
else 
  xo = 'x'
end
puts 'Enter player 2 name'
name=gets.chomp
p2 = Players.new(name, xo)
game = Game.new(p1, p2, grid)
puts grid.board
puts 'Player 1 choose your position'
pos=gets.chomp
game.movements(p1, pos.to_i)
puts 'Player 2 choose your position'
puts grid.board
pos=gets.chomp
game.movements(p2, pos.to_i)
puts grid.board

