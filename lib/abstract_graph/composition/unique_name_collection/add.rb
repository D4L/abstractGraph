# required in "abstract_graph/composition/unique_name_collection"

module AbstractGraph
  module Composition
    class UniqueNameCollection

      # d: Adds the object to our UNC.
      # a: Goes through all linked UNCs and check the name doesn't exist before
      #   adding the object.
      # t: |all linked|
      # p: Object o that implements #name
      # r: The object o itself
      def add( o )
        # note that otherUnique includes ourself
        @otherUnique.each do |unc|
          raise IndexError if unc.collection.has_key? o.name
        end
        @collection[o.name] = o
      end

    end
  end
end
