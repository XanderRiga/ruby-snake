# frozen_string_literal: true

module Interactors
  class FloodFill
    def call(starting_coord, matrix)
      curr_matrix = Marshal.load(Marshal.dump(matrix))

      queue = Queue.new
      queue << starting_coord
      enqueued_points = [starting_coord]

      until queue.empty?
        curr_coord = queue.pop

        next if !on_board?(curr_coord, curr_matrix) || snake_value?(curr_matrix[curr_coord.y][curr_coord.x])

        curr_matrix[curr_coord.y][curr_coord.x] = 'x'

        if valid_space?(curr_coord.up, curr_matrix) && !enqueued_points.include?(curr_coord.up)
          queue << curr_coord.up
          enqueued_points << curr_coord.up
        end

        if valid_space?(curr_coord.down, curr_matrix) && !enqueued_points.include?(curr_coord.down)
          queue << curr_coord.down
          enqueued_points << curr_coord.down
        end

        if valid_space?(curr_coord.left, curr_matrix) && !enqueued_points.include?(curr_coord.left)
          queue << curr_coord.left
          enqueued_points << curr_coord.left
        end

        if valid_space?(curr_coord.right, curr_matrix) && !enqueued_points.include?(curr_coord.right)
          queue << curr_coord.right
          enqueued_points << curr_coord.right
        end
      end

      curr_matrix
    end

    private

    # These are the values of snakes in the matrix as defined in interactors/matrix.rb
    def snake_value?(value)
      [1, 2, 3, 4, 5, 6].include?(value)
    end

    def valid_space?(coord, curr_matrix)
      on_board?(coord, curr_matrix) && (curr_matrix[coord.y][coord.x] == 0 || curr_matrix[coord.y][coord.x] == 7)
    end

    def on_board?(coord, curr_matrix)
      coord.x < curr_matrix[0].length &&
        coord.x >= 0 &&
        coord.y < curr_matrix.length &&
        coord.y >= 0
    end
  end
end
