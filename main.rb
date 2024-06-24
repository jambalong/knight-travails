# frozen_string_literal: true

require_relative 'lib/board'
require_relative 'lib/knight'
require 'pry-byebug'

game = Board.new

game.knight_moves([0, 0], [3, 3])
game.knight_moves([5, 4], [6, 4])
game.knight_moves([0, 0], [7, 7])
