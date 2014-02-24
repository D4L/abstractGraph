# required in "abstract_graph/graph/template"

module AbstractGraph
  class Graph
    class << self

      # d: Create a peterson graph.
      # a: It adds 10 vertices "v(i)", i=2^0..9. Then adds the specified edges, according to the
      #   specified edges array.
      # t: constant
      # p: none
      # r: a peterson graph
      # create a petersen graph.
      # ie, a 3 regular graph with 10 vertices and 15 edges
      def petersen_graph
        result = new

        vertexNames = []
        # add all the vertices
        10.times do |i|
          vName = 2**i
          vertexNames << vName
          result.add_vertex "v#{vName}"
        end

        specifiedEdges = [
        [0, 1], [0, 5], [0, 4],
        [1, 2], [2, 3], [3, 4],
        [1, 6], [2, 7], [3, 8],
        [4, 9], [5, 8], [5, 7],
        [6, 9], [7, 9], [6, 8]]

        specifiedEdges.each do |edge1, edge2|
          result.add_edge "e#{vertexNames[edge1] + vertexNames[edge2]}", "v#{vertexNames[edge1]}", "v#{vertexNames[edge2]}"
        end

        result
      end

    end
  end
end
