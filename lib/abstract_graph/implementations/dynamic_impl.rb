# required in "abstract_graph/implementations"

module AbstractGraph
  module Implementations

    class DynamicImpl
    end

  end
end

dynamic_impl_path = "abstract_graph/implementations/dynamic_impl"

require dynamic_impl_path + "/initialize"
require dynamic_impl_path + "/method_missing"
require dynamic_impl_path + "/dup"
