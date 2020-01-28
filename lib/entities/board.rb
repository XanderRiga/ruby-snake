# frozen_string_literal: true

require 'matrix'
require_relative 'base'
require_relative 'snake'

module Entities
  class Board < Base
    attribute :height, Types::Strict::Integer
    attribute :width, Types::Strict::Integer
    attribute :food, Types::Strict::Array.of(Entities::Coord)
    attribute :snakes, Types::Strict::Array.of(Entities::Snake)

    def matrix
      @matrix ||= build_matrix
    end

    def print_matrix
      puts "\n"
      puts "Current board matrix\n"
      (0...height).each do |i|
        puts matrix.row(i)
      end
    end

    private

    # 0: empty space
    # 1: snake head
    # 2: snake body
    # 3: snake tail
    # 4: food
    def build_matrix
      Matrix.build(height, width) do |row, col|
        coord = Coord.new(x: col, y: row)
        if food.include?(coord)
          4
        elsif snake_bodies.include?(coord)
          if snake_heads.include?(coord)
            1
          elsif snake_tails.include?(coord)
            3
          else
            2
          end
        else
          0
        end
      end
    end

    def snake_heads
      snakes.map(&:head)
    end

    def snake_bodies
      snakes.map(&:body).flatten
    end

    def snake_tails
      snakes.map(&:tail)
    end
  end
end
