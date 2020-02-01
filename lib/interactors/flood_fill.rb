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

        next if !on_board?(curr_coord) || snake_value?(@curr_matrix[curr_coord.y][curr_coord.x])

        @curr_matrix[curr_coord.y][curr_coord.x] = 'x'

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
      on_board?(coord) && (@curr_matrix[coord.y][coord.x] == 0 || @curr_matrix[coord.y][coord.x] == 7)
    end

    def on_board?(coord)
      coord.x < @curr_matrix[0].length &&
        coord.x >= 0 &&
        coord.y < @curr_matrix.length &&
        coord.y >= 0
    end
  end
end
