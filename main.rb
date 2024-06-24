# frozen_string_literal: true

require_relative 'lib/board'
require_relative 'lib/knight'
require 'pry-byebug'

game = Board.new

game.knight_moves([0,0], [3,3])
game.knight_moves([3,3],[0,0])

game.knight_moves([0,0],[7,7])
