# frozen_string_literal: true

require_relative '../lib/transforms/request_to_objects'

def move(board)
  puts 'request hash: ' + board
  request = Transforms::RequestToObjects.new.call(board)
  request.board.print_matrix

  { move: :up }
end
