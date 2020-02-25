# frozen_string_literal: true

# Class Game For Initialization of the Game
class Game
  attr_reader :player1, :player2, :winner
  def initialize(player1, player2, grid)
    @player1 = player1
    @player2 = player2
    @grid = grid
    @a_r = Array.new(3) { Array.new(2, 0) }
    @k = 0
    @t = 0
  end
  # rubocop: disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
  # rubocop: disable Metrics/MethodLength

  def sum
    @t += 1
    return unless @t == 3

    @k += 1
    @t = 0
  end

  def conv_to_array
    @k = 0
    @t = 0
    @grid.grid.each do |n|
      if @k.zero?
        @a_r[@k][@t] = n
        sum
      elsif @k == 1
        @a_r[@k][@t] = n
        sum
      elsif @k == 2
        @a_r[@k][@t] = n
        sum
      end
    end
  end

  def movements(player, num)
    @grid.grid[num - 1] = player.symbol
  end

  # rubocop: disable Metrics/AbcSize

  def win
    temp_string = if @winner == @player1.symbol
                    "#{@player1.name.upcase} Congratulation You Just WON ! ! !"
                  elsif @winner == @player2.symbol
                    "#{@player2.name.upcase} Congratulation You Just WON ! ! !"
                  else
                    "You're All a Bunch of LOOSERS"
                  end
    temp_string
  end

  def playing?
    bool = true
    @winner = nil
    (0..2).each do |i|
      if @a_r[i][0] == @a_r[i][1] && @a_r[i][0] == @a_r[i][2]
        bool = false
        @winner = @a_r[i][0]
      end
      if @a_r[0][i] == @a_r[1][i] && @a_r[0][i] == @a_r[2][i]
        bool = false
        @winner = @a_r[0][i]
      end
      if @a_r[0][0] == @a_r[1][1] && @a_r[0][0] == @a_r[2][2]
        bool = false
        @winner = @a_r[0][0]
      end
      if @a_r[0][2] == @a_r[1][1] && @a_r[0][2] == @a_r[2][0]
        bool = false
        @winner = @a_r[0][2]
      end
    end
    bool = false if @grid.grid.none?(Numeric)
    bool
  end
  # rubocop: enable Metrics/AbcSize
  # rubocop: enable  Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
  # rubocop: enable Metrics/MethodLength

  def who_plays(player)
    temp = if player == @player1
             @player2
           else
             @player1
           end
    temp
  end
end
