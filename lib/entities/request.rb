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
  end
end
