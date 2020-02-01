# frozen_string_literal: true

require_relative '../../lib/entities/coord'

module Interactors
  class Matrix
    def build(request)
      matrix = Array.new(request.board.height) { Array.new(request.board.width, 0) }

      build_board(request, matrix)
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
    def build_board(request, matrix)
      request.board.food.each do |food|
        matrix[food.y][food.x] = 7
      end

      matrix[request.you.head.y][request.you.head.x] = 4
      matrix[request.you.tail.y][request.you.tail.x] = 6

      request.you.body.each do |body|
        matrix[body.y][body.x] = 5 if matrix[body.y][body.x] == 0
      end

      request.board.snake_heads.each do |head|
        matrix[head.y][head.x] = 1 if matrix[head.y][head.x] == 0
      end

      request.board.snake_tails.each do |tail|
        matrix[tail.y][tail.x] = 3 if matrix[tail.y][tail.x] == 0
      end

      request.board.snake_bodies.each do |body|
        matrix[body.y][body.x] = 2 if matrix[body.y][body.x] == 0
      end

      matrix
    end
  end
end
