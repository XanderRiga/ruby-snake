# frozen_string_literal: true

require_relative '../lib/transforms/request_to_objects'

def move(board)
  request = Transforms::RequestToObjects.new.call(board)

  { move: :up }
end
