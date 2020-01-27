# frozen_string_literal: true

require_relative 'base'
require_relative 'snake_body'

module Entities
  class Snake < Base
    attribute :id, Types::Strict::String
    attribute :name, Types::Strict::String
    attribute :health, Types::Strict::Integer
    attribute :body, Entities::SnakeBody

    def head
      body.coords.first
    end
  end
end
