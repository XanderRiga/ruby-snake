# frozen_string_literal: true

module Interactors
  class FloodFill
    def initialize
      @curr_matrix = nil
    end

    def call(starting_coord, matrix)
      @curr_matrix = matrix

      queue = Queue.new
      queue << starting_coord

      until queue.empty?
        curr_coord = queue.pop

        next if !on_board?(curr_coord) || @curr_matrix[curr_coord.y, curr_coord.x] != 0

        @curr_matrix = mark_space_visited(curr_coord)

        queue << curr_coord.up if on_board?(curr_coord.up) && @curr_matrix[curr_coord.up.y, curr_coord.up.x] == 0
        if on_board?(curr_coord.down) && @curr_matrix[curr_coord.down.y, curr_coord.down.x] == 0
          queue << curr_coord.down
        end
        if on_board?(curr_coord.left) && @curr_matrix[curr_coord.left.y, curr_coord.left.x] == 0
          queue << curr_coord.left
        end
        if on_board?(curr_coord.right) && @curr_matrix[curr_coord.right.y, curr_coord.right.x] == 0
          queue << curr_coord.right
        end
      end

      @curr_matrix
    end

    private

    # Returns a new matrix with the space marked with an x
    def mark_space_visited(coord)
      ::Matrix.build(@curr_matrix.row_count, @curr_matrix.column_count) do |row, col|
        if row == coord.y && col == coord.x
          'x'
        else
          @curr_matrix[row, col]
        end
      end
    end

    def on_board?(coord)
      coord.x < @curr_matrix.column_count &&
        coord.x >= 0 &&
        coord.y < @curr_matrix.row_count &&
        coord.y >= 0
    end
  end
end
