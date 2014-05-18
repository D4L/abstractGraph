# required in "abstract_graph/implementations/dynamic_impl"

module AbstractGraph
  module Implementations
    class DynamicImpl

      # d: 
      # a: 
      # t: constant
      # p:
      # r: 
      def method_missing m, *args, &block
        @secret_impl.send(m, *args, &block)
      end

    end
  end
end
