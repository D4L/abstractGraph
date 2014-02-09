# required in "abstract_graph/composition/unique_name_collection"

module AbstractGraph
  module Composition
    class UniqueNameCollection

      # d: Change the name of a vertex in our graph.
      # a: Check that no other linked UNC has the name, then swap it.
      # t: |all collections|
      # p: String oldname represents the current vertex's name
      #   String newname represents the new name of our vertex
      # r: UNC itself
      def rename( oldname, newname )
        return nil unless @collection.has_key? oldname

        @otherUnique.each do |unc|
          throw Exception if unc.collection[newname]
        end

        # rename the object itself
        @collection[oldname].name = newname
        # remap the name
        @collection[newname] = @collection[oldname]
        # clear the old name
        @collection.delete oldname
        self
      end

    end
  end
end
