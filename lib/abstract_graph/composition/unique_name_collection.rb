# required in "abstract_graph/composition"

module AbstractGraph
  module Composition

    # public UniqueNameCollection class
    # Note that the collection of this
    #   class must implement #name
    class UniqueNameCollection
      attr_accessor :collection
      attr_accessor :namespace_ticket
      @@namespace = {}
      @@namespace_counter = 0
    end

  end
end

require "abstract_graph/composition/unique_name_collection/initialize"
require "abstract_graph/composition/unique_name_collection/add"
require "abstract_graph/composition/unique_name_collection/dup"
require "abstract_graph/composition/unique_name_collection/method_missing"
require "abstract_graph/composition/unique_name_collection/link"
require "abstract_graph/composition/unique_name_collection/rename"
require "abstract_graph/composition/unique_name_collection/each"
require "abstract_graph/composition/unique_name_collection/ticket"
require "abstract_graph/composition/unique_name_collection/delete"
require "abstract_graph/composition/unique_name_collection/find"