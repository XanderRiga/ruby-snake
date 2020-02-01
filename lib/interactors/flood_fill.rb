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

        next if !on_board?(curr_coord) || snake_value?(@curr_matrix[curr_coord.y, curr_coord.x])

        @curr_matrix = mark_space_visited(curr_coord)

        queue << curr_coord.up if valid_space?(curr_coord.up)

        queue << curr_coord.down if valid_space?(curr_coord.down)

        queue << curr_coord.left if valid_space?(curr_coord.left)

        queue << curr_coord.right if valid_space?(curr_coord.right)
      end

      @curr_matrix
    end

    private

    # These are the values of snakes in the matrix as defined in interactors/matrix.rb
    def snake_value?(value)
      [1, 2, 3, 4, 5, 6].include?(value)
    end

    def valid_space?(coord)
      on_board?(coord) && (@curr_matrix[coord.y, coord.x] == 0 || @curr_matrix[coord.y, coord.x] == 7)
    end

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
