# frozen_string_literal: true

require_relative 'knight'

# Board class acting as a graph data structure
class Board
  attr_accessor :piece

  def initialize
    @piece = nil
  end

  def knight_moves(location, destination)
    self.piece = Knight.new(location)
    build_tree(destination)
    move_piece(destination)
    print_path(piece)
  end

  private

  def print_path(piece)
    paths = find_path(piece)
    puts "=> You made it in #{paths.length - 1} moves! Here's your path:"
    paths.each { |path| p path }
  end

  def move_piece(destination)
    queue = []
    until piece.position == destination
      piece.paths.each { |path| queue << path }
      self.piece = queue.shift
    end
  end

  def build_tree(destination, queue = [piece])
    until queue.empty?
      current_piece = queue.shift
      return if current_piece.position == destination

      build_paths(current_piece)

      current_piece.paths.each do |path|
        queue << path unless queue.include?(path)
      end
    end
  end

  def build_paths(piece)
    piece.moves.each do |move|
      path = piece.class.new(move, piece)
      piece.paths << path unless piece.paths.include?(path)
    end
  end

  def find_path(piece, path = [])
    return path.reverse unless piece

    path << piece.position
    find_path(piece.last_pos, path)
  end
end
