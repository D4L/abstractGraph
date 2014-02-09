# required in "abstract_graph/composition/unique_name_collection"

module AbstractGraph
  module Composition
    class UniqueNameCollection

      # d: Links the UNC so they have unique namespace.
      # a: Creates a temporary namespace to check all the names by pre-linking,
      #   if it's fine, then link by setting all the otherUnique to the combined
      # t: |all collections|
      # p: UniqueNameCollection unc is the other collection we want to link
      # r: false if the two collections are not already mutually unique
      #   UNC if it succeeds
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
        self
      end

    end
  end
end
