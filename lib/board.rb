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
    construct_path_tree_to(destination)
    move_piece_to(destination)
    print_move_path(piece)
  end

  private

  def print_move_path(piece)
    paths = trace_path_back(piece)
    puts "=> You made it in #{paths.length - 1} moves! Here's your path:"
    paths.each { |path| p path }
  end

  def move_piece_to(destination)
    queue = []
    until piece.position == destination
      piece.paths.each { |path| queue << path }
      self.piece = queue.shift
    end
  end

  def construct_path_tree_to(destination, queue = [piece])
    until queue.empty?
      current_piece = queue.shift
      return if current_piece.position == destination

      generate_possible_paths(current_piece)

      current_piece.paths.each do |path|
        queue << path unless queue.include?(path)
      end
    end
  end

  def generate_possible_paths(piece)
    piece.moves.each do |move|
      unless path_exists_at_position?(piece, move)
        new_path = create_path(piece, move)
        piece.paths << new_path
      end
    end
  end

  def path_exists_at_position?(piece, position)
    piece.paths.any? { |path| path.position == position }
  end

  def create_path(piece, position)
    piece.class.new(position, piece)
  end

  def trace_path_back(piece, current_path = [])
    return current_path.reverse unless piece

    current_path << piece.position
    trace_path_back(piece.last_pos, current_path)
  end
end
