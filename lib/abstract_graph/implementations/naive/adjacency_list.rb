# required in "abstract_graph/implementations/naive"

module AbstractGraph
  module Implementations
    class Naive

      # d: Return adjacent vertices
      # a: Go through all the edges, checking the vertices of each edge, if there
      #   is an edge where the vertices includes the given vertex, add it to
      #   the result.
      # t: |edges|
      # p: s is the name of vertex
      # r: returns nil if nothing, returns hash of { vertex_name => edge_name }
      def adjacency_list( s )
        # go through edges, and append to result if found edge
        result = {}
        @edges.each do |e|
          vertex_names = e.vertices.map(&:name)
          next unless vertex_names.include? s
          result[(vertex_names-[s])[0]] = e.name
        end
        return nil if result.size == 0
        result
      end

    end
  end
end
