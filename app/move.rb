# frozen_string_literal: true

require_relative '../lib/transforms/request_to_objects'
require_relative '../lib/interactors/choose_direction'
require_relative '../lib/entities/coord'

def move(board)
  # puts JSON.pretty_generate(board)
  request = Transforms::RequestToObjects.new.call(board)
  # request.print_matrix

  direction = Interactors::ChooseDirection.new.call(request)

  { move: direction }
end
