# required in "abstract_graph/composition/unique_name_collection"

module AbstractGraph
  module Composition
    class UniqueNameCollection

      # d: Initializes the UNC.
      # a: Create the collection and starts link array, putting itself in
      # t: constant
      # p:
      # r: new UNC
      def initialize
        @collection = Hash.new
        @otherUnique = [self]
      end

    end
  end
end
