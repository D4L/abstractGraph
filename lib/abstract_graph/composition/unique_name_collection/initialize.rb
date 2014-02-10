# required in "abstract_graph/composition/unique_name_collection"

module AbstractGraph
  module Composition
    class UniqueNameCollection

      # d: Initializes the UNC.
      # a: Assign itself a namespace_ticket and start the collection by adding
      #   the namespace a set of names and backreference of tickets
      # t: constant
      # p:
      # r: new UNC
      def initialize
        @collection = Hash.new
        @@namespace_counter += 1
        @namespace_ticket = Ticket.new(@@namespace_counter)
        @@namespace[@@namespace_counter] = [Set.new, Set.new([@namespace_ticket])]
      end

    end
  end
end
