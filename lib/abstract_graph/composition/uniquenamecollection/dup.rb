# required in "abstract_graph/composition/uniquenamecollection"

module AbstractGraph
  module Composition
    class UniqueNameCollection

      # does a deep copy of the object, in otherwords
      #   copies every object in the collection
      def dup
        other = UniqueNameCollection.new
        # copy each object in our collection over
        @collection.each_value do |o|
          other.add o
        end
        other
      end

    end
  end
end
