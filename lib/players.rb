# frozen_string_literal: true

# Player Init a Player
class Players
  attr_reader :name, :symbol
  def initialize(name, symbol)
    @name = name.capitalize
    @symbol = symbol.capitalize
  end
end
