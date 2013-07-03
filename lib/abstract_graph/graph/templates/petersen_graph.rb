# required in "abstract_graph/graph/template"

module AbstractGraph
  class Graph
    class << self

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

        specifiedEdges.each do |edgePair|
          result.add_edge "e#{vertexNames[edgePair[0]] + vertexNames[edgePair[1]]}", "v#{vertexNames[edgePair[0]]}", "v#{vertexNames[edgePair[1]]}"
        end

        result
      end

    end
  end
end
