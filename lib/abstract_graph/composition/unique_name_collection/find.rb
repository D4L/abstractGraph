# required in "abstract_graph/composition/unique_name_collection"

module AbstractGraph
  module Composition
    class UniqueNameCollection

      # d: Finds a stored object given the name.
      # a: Goes into collection and retrieves based on key.
      # t: constant
      # p: name of object
      # r: object
      def find(name)
        @collection[name]
      end

    end
  end
end
