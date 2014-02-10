# required in "abstract_graph/composition/unique_name_collection"

module AbstractGraph
  module Composition
    class UniqueNameCollection

      # d: Adds the object to our UNC.
      # a: Ensure that our namespace doesn't already have the object name and
      #   then add the object to namespace and collection.
      # t: constant
      # p: Object o that implements #name
      # r: The object o itself
      def add( o )
        set = @@namespace[@namespace_ticket.get][0]
        raise IndexError if set.include? o.name
        set << o.name
        @collection[o.name] = o
        self
      end

    end
  end
end
