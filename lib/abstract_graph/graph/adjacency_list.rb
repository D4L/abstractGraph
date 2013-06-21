# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # return the adjacent vertices in of a vertex
    # p: String s represents the name of the query vertex
    def adjacency_list( s )
      result = @edges.collect do |id,e|
        e.vertices.collect do |v|
          v.name
        end - [s]
      end.delete_if do |adj|
        adj.size == 2
      end.flatten

      # return nil if result is empty
      if result.size == 0
        return nil
      else
        return result
      end
    end

  end
end