# frozen_string_literal: true

# Knight class representng a node in a graph
class Knight
  MOVEMENTS = [
    [1, 2], [2, 1], [-1, 2], [-2, 1], [1, -2], [2, -1], [-1, -2], [-2, -1]
  ].freeze

  attr_accessor :position, :last_pos, :moves, :paths

  def initialize(position, last_pos = nil)
    @position = position
    @last_pos = last_pos
    @moves = possible_moves(position)
    @paths = []
  end

  def possible_moves(position, moves = [])
    MOVEMENTS.each do |movement|
      x = position[0] + movement[0]
      y = position[1] + movement[1]

      moves << [x, y] if x.between?(0, 7) && y.between?(0, 7)
    end

    moves
  end

end
