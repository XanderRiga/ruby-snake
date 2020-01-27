# frozen_string_literal: true

require_relative '../../lib/entities/request'
require_relative '../../lib/entities/game'
require_relative '../../lib/entities/board'
require_relative '../../lib/entities/snake'
require_relative '../../lib/entities/snake_body'
require_relative '../../lib/entities/food'
require_relative '../../lib/entities/coord'

module Transforms
  class RequestToObjects
    def call(request)
      Entities::Request.new(
        game: Entities::Game.new(id: request[:game][:id]),
        turn: request[:turn],
        board: build_board(request[:board]),
        you: build_snake(request[:you])
      )
    end

    private

    def build_board(board)
      Entities::Board.new(
        height: board[:height],
        width: board[:width],
        food: build_food(board[:food]),
        snakes: build_snakes(board[:snakes])
      )
    end

    def build_food(food)
      Entities::Food.new(
        coords: food.map { |coord| Entities::Coord.new(x: coord[:x], y: coord[:y]) }
      )
    end

    def build_snakes(snakes)
      snakes.map do |snake|
        build_snake(snake)
      end
    end

    def build_snake(snake)
      Entities::Snake.new(
        id: snake[:id],
        name: snake[:name],
        health: snake[:health],
        body: build_body(snake[:body])
      )
    end

    def build_body(body)
      Entities::SnakeBody.new(
        coords: body.map { |coord| Entities::Coord.new(x: coord[:x], y: coord[:y]) }
      )
    end
  end
end
