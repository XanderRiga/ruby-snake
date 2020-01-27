# frozen_string_literal: true

require_relative 'base'
require_relative 'game'
require_relative 'board'
require_relative 'snake'

module Entities
  class Request < Base
    attribute :game, Entities::Game
    attribute :turn, Types::Strict::Integer
    attribute :board, Entities::Board
    attribute :you, Entities::Snake
  end
end
