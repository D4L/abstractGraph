# required in "abstract_graph/composition/unique_name_collection"

module AbstractGraph
  module Composition
    class UniqueNameCollection

      # d: Delete the object from the collection
      # a: Delete the object from the collection and from the nameserver
      # t: constant
      # p: name of object we want to delete
      # r: object that was deleted
      def delete( name )
        return nil unless @collection[name]
        @@namespace[@namespace_ticket.get][0].delete name
        @collection.delete name
      end

    end
  end
end
