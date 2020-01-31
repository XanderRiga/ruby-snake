# frozen_string_literal: true

require_relative 'base'

module Entities
  class Coord < Base
    attribute :x, Types::Strict::Integer
    attribute :y, Types::Strict::Integer

    def up
      Coord.new(x: x, y: y - 1)
    end

    def down
      Coord.new(x: x, y: y + 1)
    end

    def left
      Coord.new(x: x - 1, y: y)
    end

    def right
      Coord.new(x: x + 1, y: y)
    end
  end
end
