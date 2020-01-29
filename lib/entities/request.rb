# frozen_string_literal: true

require_relative 'base'
require_relative 'game'
require_relative 'board'
require_relative 'snake'
require_relative '../interactors/distance'

module Entities
  class Request < Base
    attribute :game, Entities::Game
    attribute :turn, Types::Strict::Integer
    attribute :board, Entities::Board
    attribute :you, Entities::Snake

    def closest_food
      sorted_food = board.food.sort_by do |food|
        Interactors::Distance.new.call(food, you.head)
      end

      sorted_food.first
    end

    def matrix
      @matrix ||= build_matrix
    end

    def print_matrix
      puts "\n"
      puts "Current board matrix\n"
      (0...board.height).each do |i|
        puts matrix.row(i)
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
    def build_matrix
      Matrix.build(board.height, board.width) do |row, col|
        coord = Coord.new(x: col, y: row)
        if board.food.include?(coord)
          4
        elsif you.body.include?(coord)
          if you.head == coord
            5
          elsif you.tail == coord
            7
          else
            6
          end
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
      board.snakes.map(&:head)
    end

    def snake_bodies
      board.snakes.map(&:body).flatten
    end

    def snake_tails
      board.snakes.map(&:tail)
    end
  end
end
