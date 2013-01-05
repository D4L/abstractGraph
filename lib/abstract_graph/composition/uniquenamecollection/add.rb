# required in "abstract_graph/composition/uniquenamecollection"

module AbstractGraph
  module Composition
    class UniqueNameCollection

      # adds an object o into the collection
      # p: Object o that implements #name
      def add( o )
        # note that otherUnique includes ourself
        @otherUnique.each do |unc|
          raise IndexError if unc[o.name]
        end
        @collection[o.name] = o
      end

    end
  end
end
