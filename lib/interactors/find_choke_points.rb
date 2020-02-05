# frozen_string_literal: true

module Interactors
  class FindChokePoints
    def call(filled_matrix, request)
      # We want to check if we replace some of the Xs in the matrix
      # with something else, does it split the Xs into separate areas.
      # If it does split, we want to know how bad it is so we can know
      # if a snake has the potential to cut us off.
      filled_matrix.each do |row|
        row.each do |column|
          next if filled_matrix[row][column] != 'x'


        end
      end
    end
  end
end
