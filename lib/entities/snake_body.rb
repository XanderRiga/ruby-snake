# frozen_string_literal: true

require_relative 'base'
require_relative 'coords'

module Entities
  class SnakeBody < Base
    attribute :coords, Types::Strict::Array.of(Entities::Coords)
  end
end
