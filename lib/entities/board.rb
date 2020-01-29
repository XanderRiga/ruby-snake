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
  end
end
