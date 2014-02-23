# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # d: Check if graph is connected
    # a: Do a depth first search. So we push the first vertex, and then keep trying to go to adjacent
    #   vertices until all of them are seen. In the end, check if the list of seen vertices is the
    #   same as the complete vertex list.
    # t: |vertices| * t(adjacency_list) which is |vertices| * |edges|
    # p: none
    # r: returns true if graph is connected, false otherwise
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
