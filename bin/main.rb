class Game
    attr_accessor :grid, :player1, :player2

    def initialize()
        @player1 = []
        @player2 = []
        @grid = []
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

    class Moves
        attr_accessor :move, :player, :grid
        def initialize(move,player,grid)
            @move = move
            @player = player
            @grid = grid
            movements
        end

        def movements
            puts @grid.grid[@move] = @player.symbol
        end
    end
end

game = Game.new()
grid = Game::Grid.new()
p1 = Game::Players.new('salvador', 'X')
p2 = Game::Players.new('daniel','o')
puts grid.board
puts p1.name
puts p2.name
moves = Game::Moves.new(1,p1,grid)
puts grid.board