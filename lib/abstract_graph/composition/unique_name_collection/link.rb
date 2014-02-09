# required in "abstract_graph/composition/unique_name_collection"

module AbstractGraph
  module Composition
    class UniqueNameCollection

      # links two collections together so that their names
      #   will be mutually unique
      # p: UniqueNameCollection unc is the other collection
      #      we want to link
      # r: false if the two collections are not already
      #      mutually unique
      def link( unc )
        # note that either otherUnique may be alot
        combinedUnique = @otherUnique | unc.otherUnique

        # check if there are already any duplicates
        allNames = []
        combinedUnique.each do |tunc|
          return nil unless ( tunc.collection.keys & allNames ).empty?
          allNames |= tunc.collection.keys
        end

        # set each one to have the same uniquespace
        combinedUnique.each do |tunc|
          tunc.otherUnique = combinedUnique
        end
      end

    end
  end
end
