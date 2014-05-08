# required in "abstract_graph/implementations/naive"

module AbstractGraph
  module Implementations

    class Naive

      # d: Set the data of a certain resource in the implementation
      # a: First check if resource exists by the given name. Set resource type, then set
      #   the attr on the resource with the value, unless the attr is name, in which case
      #   do a rename.
      # t: |edges| or |vertices|
      # p: name is the name of the resource, whether it's vertex or edge.
      #   attr is the attribute we want to set, value is the value we want to set on the
      #   attribute.
      # r: nil if anything fails, otherwise, self
      def set_data name, attr, value
        if @edges.find name
          resource = @edges.find name
          resource_type = :edge
        elsif @vertices.find name
          resource = @vertices.find name
          resource_type = :vertex
        else
          return nil
        end

        # do special stuff if the attribute is :name, namely, rename
        if attr == :name && resource_type == :edge
          return nil unless @edges.rename name, value
        elsif attr == :name && resource_type == :vertex
          return nil unless @vertices.rename name, value
        else
          resource.attr = value
        end
        self
      end

    end
  end
end
