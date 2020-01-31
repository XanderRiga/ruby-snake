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
    # 4: food
    # 5: our head
    # 6: our body
    # 7: our tail
    def board_values(request, row, col)
      coord = Entities::Coord.new(x: col, y: row)
      if request.board.food.include?(coord)
        4
      elsif request.you.body.include?(coord)
        if request.you.head == coord
          5
        elsif request.you.tail == coord
          7
        else
          6
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
