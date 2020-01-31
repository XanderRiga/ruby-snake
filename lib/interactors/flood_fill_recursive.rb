# frozen_string_literal: true

module Interactors
  class FloodFillRecursive
    def call(coord, matrix)
      return matrix if matrix[coord.y, coord.x] != 0

      new_matrix = mark_space_visited(coord, matrix)

      call(coord.up, new_matrix) if on_board?(coord.up, new_matrix)
      call(coord.down, new_matrix) if on_board?(coord.down, new_matrix)
      call(coord.left, new_matrix) if on_board?(coord.left, new_matrix)
      call(coord.right, new_matrix) if on_board?(coord.right, new_matrix)
    end

    # Returns a new matrix with the space marked with an x
    def mark_space_visited(coord, matrix)
      ::Matrix.build(matrix.row_count, matrix.column_count) do |row, col|
        if row == coord.y && col == coord.x
          'x'
        else
          matrix[row, col]
        end
      end
    end

    def on_board?(coord, matrix)
      coord.x < matrix.column_count &&
        coord.x >= 0 &&
        coord.y < matrix.row_count &&
        coord.y >= 0
    end
  end
end
