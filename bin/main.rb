class Game
    attr_accessor :grid, :player1, :player2

    def initialize(player1, player2, grid)
        @player1 = player1
        @player2 = player2
        @grid = grid
    end


    def movements (player, num)
        @grid.grid[num] = player.symbol
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
p1 = Players.new('salvador', 'X')
p2 = Players.new('daniel','o')
game = Game.new(p1, p2, grid)
game.movements(p1, 3)
puts grid.board
puts p1.name
puts p2.name
puts game.grid.board