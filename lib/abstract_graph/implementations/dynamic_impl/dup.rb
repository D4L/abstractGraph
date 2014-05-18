# required in "abstract_graph/implementations/dynamic_impl"

module AbstractGraph
  module Implementations
    class DynamicImpl

      # d: 
      # a: 
      # t: constant
      # p:
      # r: copy of the implementation
      def dup
        other = self.class.new

        other.instance_variable_set :@secret_impl, @secret_impl.dup

        other
      end

    end
  end
end
