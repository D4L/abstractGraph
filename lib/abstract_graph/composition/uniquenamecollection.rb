# required in "abstract_graph/composition"

module AbstractGraph
  module Composition

    # public UniqueNameCollection class
    # Note that the collection of this
    #   class must implement #name
    class UniqueNameCollection
      attr_accessor :collection

    end
  end
end

require "abstract_graph/composition/uniquenamecollection/initialize"
require "abstract_graph/composition/uniquenamecollection/add"
