# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # d: Return adjacent vertices
    # a: Go through the edges and collect all the vertex names, subtracting our own. Thus, only the
    #   'vertices' tuples that have one vertex left are adjacent since the other vertex got deleted.
    #   Then, we can use the remaining array and return it.
    # t: |edges|
    # p: s is the name of vertex
    # r: returns nil if nothing, returns array of adjacent vertices' names
    def adjacency_list( s )
      # this collects all the edges at first
      result = @edges.collect do |e|
        e.vertices.collect do |v|
          v.name
        end - [s]
      end.delete_if do |adj|
        # and deletes the ones with only one remaining tracked
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
