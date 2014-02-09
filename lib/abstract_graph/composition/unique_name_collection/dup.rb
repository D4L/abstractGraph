# required in "abstract_graph/composition/unique_name_collection"

module AbstractGraph
  module Composition
    class UniqueNameCollection

      # d: Deep copies our object.
      # a: Does a deep copy of the object, in otherwords
      #   copies every object in the collection.
      # t: |collection|
      # p:
      # r: the copy of the UNC
      def dup
        other = self.class.new
        # copy each object in our collection over
        @collection.each_value do |o|
          other.add o.dup
        end
        other
      end

    end
  end
end
