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
