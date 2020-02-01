# frozen_string_literal: true

require_relative 'flood_fill'

module Interactors
  class ChooseDirection
    def call(request)
      matrix = {
        up: num_safe_spaces(request.you.head.up, request.matrix),
        down: num_safe_spaces(request.you.head.down, request.matrix),
        left: num_safe_spaces(request.you.head.left, request.matrix),
        right: num_safe_spaces(request.you.head.right, request.matrix)
      }

      matrix.max_by { |_k, v| v }[0]
    end

    def num_safe_spaces(coord, matrix)
      new_matrix = flood_fill.call(coord, matrix)

      count_safe_spaces(new_matrix)
    end

    def count_safe_spaces(matrix)
      matrix.inject(0) do |count, row|
        count + row.count('x')
      end
    end

    def flood_fill
      @flood_fill ||= Interactors::FloodFill.new
    end
  end
end
