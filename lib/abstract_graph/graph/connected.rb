# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # checks if graph is connected
    #   ie, any vertex can be reached from any other vertex
    # r: true if graph is connected. Note that an empty graph is connected
    def connected?
      return true if @vertices.empty?
      seen = []
      toSee = [@vertices.first.name]

      # go through vertices and if we seen them, don't inspect them
      # essentially does a depth first search
      while !toSee.empty? do
        inspect = toSee.pop
        seen << inspect

        adjacentVertices = adjacency_list( inspect )
        break if adjacentVertices.nil?

        # add adjacent vertices if they're not in any of the seen lists
        adjacentVertices.each do |v|
          toSee << v if !seen.include?( v ) && !toSee.include?( v )
        end
      end
      seen.size == @vertices.size
    end

  end
end
