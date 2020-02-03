# frozen_string_literal: true

module Interactors
  class FindChokePoints
    def call(filled_matrix)
      # We want to check if we replace some of the Xs in the matrix
      # with something else, does it split the Xs into separate areas.
      # If it does split, we want to know how bad it is so we can know
      # if a snake has the potential to cut us off.
      nil
    end
  end
end
