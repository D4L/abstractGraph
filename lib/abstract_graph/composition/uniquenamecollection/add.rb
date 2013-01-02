# required in "abstract_graph/composition/uniquenamecollection"

module AbstractGraph
  module Composition
    class UniqueNameCollection

      # adds an object o into the collection
      # p: Object o that implements #name
      def add( o )
        if @collection[o.name]
          raise IndexError
        else
          @collection[o.name] = o
        end
      end

    end
  end
end
