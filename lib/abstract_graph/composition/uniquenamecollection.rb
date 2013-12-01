# required in "abstract_graph/composition"

module AbstractGraph
  module Composition

    # public UniqueNameCollection class
    # Note that the collection of this
    #   class must implement #name
    class UniqueNameCollection
      attr_accessor :collection
      attr_accessor :otherUnique
    end

  end
end

require "abstract_graph/composition/uniquenamecollection/initialize"
require "abstract_graph/composition/uniquenamecollection/add"
require "abstract_graph/composition/uniquenamecollection/dup"
require "abstract_graph/composition/uniquenamecollection/method_missing"
require "abstract_graph/composition/uniquenamecollection/link"
require "abstract_graph/composition/uniquenamecollection/rename"
require "abstract_graph/composition/uniquenamecollection/each"
