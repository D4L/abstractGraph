# required in "abstract_graph/composition/unique_name_collection"

module AbstractGraph
  module Composition
    class UniqueNameCollection

      # d: Links the UNC so they have unique namespace.
      # a: check the intersection of namespace so that there's no collision, then
      #   reset the namespace to contain the shared namespaces and update tickets
      # t: |intersection and size of ticket|
      # p: UniqueNameCollection unc is the other collection we want to link
      # r: false if the two collections are not already mutually unique
      #   UNC if it succeeds
      def link( unc )
        our_ticket = @namespace_ticket.get
        other_ticket = unc.namespace_ticket.get
        our_namespace = @@namespace[our_ticket]
        other_namespace = @@namespace[other_ticket]

        namespace_intersection = our_namespace[0] & other_namespace[0]
        return nil unless namespace_intersection.empty?

        # Create the assumption that |our_namespace| >= |other_namespace|
        if other_namespace[0].size > our_namespace[0].size
          our_namespace, other_namespace = other_namespace, our_namespace
          our_ticket, other_ticket = other_ticket, our_ticket
        end

        # Assume it is fine to link now, add to the larger namespace
        our_namespace[0].merge other_namespace[0]
        other_namespace[1].map do |ticket|
          ticket.set our_ticket
        end
        our_namespace[1].merge other_namespace[1]

        @@namespace.delete other_ticket
        self
      end

    end
  end
end
