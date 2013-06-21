# required in "abstract_graph/composition/uniquenamecollection"

module AbstractGraph
  module Composition
    class UniqueNameCollection

      # Change the name of a vertex in our graph
      # p: String oldname represents the current vertex's name
      #    String newname represents the new name of our vertex
      # note: the object needs to implement #name=
      def rename( oldname, newname )
        return nil if @collection[oldname].nil?

        @otherUnique.each do |unc|
          throw Exception if unc[newname]
        end

        # rename the object itself
        @collection[oldname].name = newname
        # remap the name
        @collection[newname] = @collection[oldname]
        # clear the old name
        @collection.delete oldname
      end

    end
  end
end