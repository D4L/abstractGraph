# required in "abstract_graph/composition/unique_name_collection/ticket"

module AbstractGraph
  module Composition
    class UniqueNameCollection
      class Ticket

        # d: Sets the Ticket number.
        # a: Sets number
        # t: constant
        # p: number to set to
        # r: self
        def set( number )
          @number = number
        end

      end
    end
  end
end
