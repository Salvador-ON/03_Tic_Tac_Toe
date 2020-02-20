# frozen_string_literal: true

# Validation of Variables
class Validation
  def move(input, grid)
    bool = if grid.grid[input].is_a?(Numeric)
             true
           else
             false
           end
    bool
  end
  # rubocop:disable Metrics/MethodLength

  def inputs(input, grid)
    input = input.to_i
    bool = if (input <= 9) && input.positive?
             if grid.grid[input - 1].is_a?(Numeric)
               true
             else
               false
             end
           else
             false
           end
    bool
  end
  # rubocop:enable Metrics/MethodLength

  def names(name)
    bool = if name.strip.empty?
             true
           else
             false
           end
    bool
  end

  def symbols(symbol)
    array = %w[X O]
    bool = if array.any?(symbol)
             false
           else
             true
           end
    bool
  end
end
