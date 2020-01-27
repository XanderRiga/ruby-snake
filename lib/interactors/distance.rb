# frozen_string_literal: true

module Interactors
  class Distance
    def call(coord_a, coord_b)
      Math.sqrt(((coord_a.x - coord_b.x)**2) + ((coord_a.y - coord_b.y)**2))
    end
  end
end
