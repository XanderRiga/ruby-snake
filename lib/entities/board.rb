# frozen_string_literal: true

require_relative 'base'
require_relative 'food'
require_relative 'snake'

module Entities
  class Board < Base
    attribute :height, Types::Strict::Integer
    attribute :width, Types::Strict::Integer
    attribute :food, Entities::Food
    attribute :snakes, Types::Strict::Array.of(Entities::Snake)
  end
end
