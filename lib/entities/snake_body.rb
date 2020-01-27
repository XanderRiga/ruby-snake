# frozen_string_literal: true

require_relative 'base'
require_relative 'coord'

module Entities
  class SnakeBody < Base
    attribute :coords, Types::Strict::Array.of(Entities::Coord)
  end
end
