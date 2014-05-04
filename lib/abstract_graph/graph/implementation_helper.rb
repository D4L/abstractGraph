# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    module ImplementationHelper
      class << self
        attr_accessor :implementation_list
      end

      def self.included(base)
        self.implementation_list = {}
        base.extend(ClassMethods)
      end

    end

  end
end

require "abstract_graph/graph/implementation_helper/add_implementation"
