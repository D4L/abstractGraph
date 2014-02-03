# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # returns a replicated graph where the vertices with names
    #   v1 and v2 merge together to a vertex named vmerged and
    #   the edges that were adjacent to v1 and v2 are now
    #   adjacent to vmerged
    # p: (Array, String)
    #      array is the string names of vertices to merge together
    #      string is the name of the final vertex
    #    (String, String, String)
    #      first two strings are the vertices to merge together
    #      last string is the name of the merged vertex
    # e: the edges prioritize v1 to v2 if there are any conflicts
    def merge_vertices( *args )
      other = self.dup
      other.merge_vertices!( *args )
    end

    # same as before except operates on the current graph
    def merge_vertices!( *args )

      # create a list of vertices we want to merge
      mergeV = []
      if args[0].class == Array
        mergeV = args[0]
      else
        mergeV << args[0] << args[1]
      end

      # first construct an array of edges in between vertices
      edgesInBetween = []
      if ( args.size == 3 )
        # do not need to go through the array of vertices
        edgesInBetween << get_edge_name( args[0], args[1] )
      else
        edgesInBetween = @edges.collect do |e|
          e.name if ( e.vertices.map do |v|
            v.name
          end & mergeV ).count == 2
        end
      end

      # delete the edges in between vertices
      edgesInBetween.each do |e|
        delete_edge!( e ) if e
      end

      # get the list of connections we want vmerged to be merged with
      finalConnections = {}
      mergeV.reverse.each do |vCheck|
        @edges.each do |e|
          [0,1].each do |edgeVId|

            # check if the edge contains our vertex
            if e.vertices[edgeVId].name == vCheck
              otherVertex = e.vertices[(edgeVId+1)%2].name
              # track the vertex with the edge name
              finalConnections[otherVertex] = e.name 
              delete_edge! e.name 
            end

          end
        end
      end

      # delete the vertices we want to merge
      mergeV.each do |v|
        delete_vertex! v
      end

      # add vmerged and connect it to adjacent vertices
      add_vertex args.last
      finalConnections.each do | vertexName, name |
        add_edge name, vertexName, args.last
      end

      self
    end

  end
end
