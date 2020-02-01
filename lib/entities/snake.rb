# frozen_string_literal: true

require_relative 'base'
require_relative 'coord'

module Entities
  class Snake < Base
    attribute :id, Types::Strict::String
    attribute :name, Types::Strict::String
    attribute :health, Types::Strict::Integer
    attribute :body, Types::Strict::Array.of(Entities::Coord)

    def head
      body.first
    end

    def tail
      body.last
    end

    def body_without_ends
      body[1, body.length - 2]
    end
  end
end
