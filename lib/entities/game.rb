# frozen_string_literal: true

require_relative 'base'

module Entities
  class Game < Base
    attribute :id, Types::Strict::String
  end
end
