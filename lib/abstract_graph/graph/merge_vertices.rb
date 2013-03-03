# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # returns a replicated graph where the vertices with names
    #   v1 and v2 merge together to a vertex named vmerged and
    #   the edges that were adjacent to v1 and v2 are now
    #   adjacent to vmerged
    # p: String v1, v2 represents the names of the vertices
    #    String vmerged represents the name of the merged vertex
    # e: the edges prioritize v1 to v2 if there are any conflicts
    def merge_vertices( v1, v2, vmerged )
      other = self.dup
      other.merge_vertices! v1, v2, vmerged
    end

    # same as before except operates on the current graph
    def merge_vertices!( v1, v2, vmerged )

      # first delete the edge in between
      edgeInBetween = get_edge_name v1, v2
      delete_edge!( edgeInBetween ) if edgeInBetween

      # get the list of connections we want vmerged to be merged with
      finalConnections = {}
      @edges.each do |name, e|
        [0, 1].each do |vertexId|
          [v1, v2].each do |vcheck|

            # check if the edge contains our vertices
            if e.vertices[vertexId].name == vcheck
              otherVertex = e.vertices[(vertexId+1)%2].name

              # check if the vertex already existed
              # if it did, we want to prioritize v1
              if finalConnections[otherVertex]
                if vcheck == v1
                  finalConnections[otherVertex] = name
                end
              else
                finalConnections[otherVertex] = name
              end
              delete_edge! name
            end
          end
        end
      end

      # delete the vertices
      delete_vertex! v1
      delete_vertex! v2

      # add vmerged and connect it to the adjacent vertices
      add_vertex vmerged
      finalConnections.each do |vertexName, name|
        add_edge name, vertexName, vmerged
      end

      self
    end

  end
end
