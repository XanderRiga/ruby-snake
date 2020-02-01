# frozen_string_literal: true

require_relative '../../lib/entities/coord'

module Interactors
  class Matrix
    def build(request)
      ::Matrix.build(request.board.height, request.board.width) do |row, col|
        board_values(request, row, col)
      end
    end

    private

    # 0: empty space
    # 1: snake head
    # 2: snake body
    # 3: snake tail
    # 4: our head
    # 5: our body
    # 6: our tail
    # 7: food
    def board_values(request, row, col)
      coord = Entities::Coord.new(x: col, y: row)
      if request.board.food.include?(coord)
        7
      elsif request.you.body.include?(coord)
        if request.you.head == coord
          4
        elsif request.you.tail == coord
          6
        else
          5
        end
      elsif request.board.snake_bodies.include?(coord)
        if request.board.snake_heads.include?(coord)
          1
        elsif request.board.snake_tails.include?(coord)
          3
        else
          2
        end
      else
        0
      end
    end
  end
end
