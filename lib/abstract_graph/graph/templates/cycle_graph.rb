# required in "abstract_graph/graph/template"

module AbstractGraph
  class Graph
    class << self

      # create a variabled sized cycle graph,
      #   ie, a connected graph such that every vertex has
      #   exactly two distinct paths to every other vertex
      # p: the number of vertices in the cycle graph
      #    coincidently, also the number of edges
      def cycle_graph n
        result = new
        vertexNames = (n-1).times.collect { |i| 2**(i + 1) }
        lastVertex  = 2**(n-1)

        # insert first vertex
        result.add_vertex "v1"
        vertexNames.each do |i|
          # insert the rest of the vertices
          result.add_vertex "v#{i}"
          # insert the edge with the previous vertex
          result.add_edge "e#{i + i/2}", "v#{i}", "v#{i/2}"
        end

        #insert the closing loop
        result.add_edge "e#{1 + lastVertex}", "v1", "v#{lastVertex}"

        result
      end

    end
  end
end
