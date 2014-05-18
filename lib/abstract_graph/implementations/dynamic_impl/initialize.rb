# required in "abstract_graph/implementations/dynamic_impl"

module AbstractGraph
  module Implementations
    class DynamicImpl

      # d: 
      # a: 
      # t: constant
      # p:
      # r: new implementation
      def initialize(options = {})
        @secret_impl = AdjacencyList.new
      end

    end
  end
end
