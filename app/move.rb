# frozen_string_literal: true

require 'awesome_print'
require_relative '../lib/transforms/request_to_objects'

def move(board)
  ap board
  request = Transforms::RequestToObjects.new.call(board)
  request.board.print_matrix

  { move: :up }
end
