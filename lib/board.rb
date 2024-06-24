# frozen_string_literal: true

require_relative 'knight'

# Board class acting as a graph data structure
class Board
  attr_reader :piece

  def knight_moves(location, destination)
    @piece = Knight.new(location)
    build_tree(destination)

    queue = []
    until piece.position == destination
      piece.paths.each { |path| queue << path }
      @piece = queue.shift
    end

    paths = find_path(piece)
    puts "=> You made it in #{paths.length} moves! Here's your path:"
    paths.each { |path| p path }
    paths
  end

  private

  def build_tree(destination, queue = [piece], path = 0)
    piece = queue[path]
    build_paths(piece)

    piece.paths.each do |path|
      next if queue.include?(path)

      queue << path
    end

    return if piece.position == destination

    build_tree(destination, queue, path + 1)
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
