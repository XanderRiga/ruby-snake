# frozen_string_literal: true

require_relative '../lib/transforms/request_to_objects'

def move(board)
  puts JSON.pretty_generate(board)
  request = Transforms::RequestToObjects.new.call(board)
  request.print_matrix

  { move: :up }
end
