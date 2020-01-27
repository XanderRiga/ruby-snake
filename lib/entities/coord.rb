# frozen_string_literal: true

require_relative 'base'

module Entities
  class Coord < Base
    attribute :x, Types::Strict::Integer
    attribute :y, Types::Strict::Integer
  end
end
