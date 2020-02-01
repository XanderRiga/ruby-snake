# frozen_string_literal: true

require_relative 'flood_fill'

module Interactors
  class ChooseDirection
    def call(request)
      {
        up: num_safe_spaces(request.you.head.up, request.matrix),
        down: num_safe_spaces(request.you.head.down, request.matrix),
        left: num_safe_spaces(request.you.head.left, request.matrix),
        right: num_safe_spaces(request.you.head.right, request.matrix)
      }.max_by { |_k, v| v }[0]
    end

    def num_safe_spaces(coord, matrix)
      new_matrix = Interactors::FloodFill.new.call(coord, matrix)

      count_safe_spaces(new_matrix)
    end

    def count_safe_spaces(matrix)
      matrix.inject(0) do |count, value|
        count += 1 if value == 'x'
        count
      end
    end
  end
end
