# required in "abstract_graph/implementations/adjacency_list"

module AbstractGraph
  module Implementations
    class AdjacencyList

      # d: Change the attribute of an object
      # a: First, finds the resource by going through all the vertices then edges; since there may
      #   be two edges, wraps it into an array. Then, check if attr is name, and set check namespace,
      #   if there are no collisions, modify the name.
      # t: |vertices| + |edges|
      # p: name is the name of the resource, whether it's a vertex or edge.
      #   attr is the attribute we want to set, value is the requested value
      #   on that attribute.
      # r: nil if anything fails, otherwise, self
      def set_data name, attr, value
        # first discover if the object is an vertex or edge
        resource = @adjacency_list.keys.find do |vertex|
          vertex.name == name
        end
        resource = [resource] if resource

        # must find both edges, if it's an edge
        resource ||= @adjacency_list.values.flatten.find_all do |edge|
          edge.name == name
        end

        if !resource.empty? && attr == :name
          namespace = edges | vertices
          raise Exception if namespace.include? value
          resource.each do |rez|
            rez.name = value
          end
        else
          return nil
        end
        self
      end

    end
  end
end
