# required in "abstract_graph/composition/unique_name_collection"

module AbstractGraph
  module Composition
    class UniqueNameCollection

      # d: This is the ticket for the nameserver in UNC
      class Ticket
        attr_accessor :number
      end

    end
  end
end

require "abstract_graph/composition/unique_name_collection/ticket/initialize"
require "abstract_graph/composition/unique_name_collection/ticket/get"
require "abstract_graph/composition/unique_name_collection/ticket/set"
