# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # d: Merges vertices together so that any edges are connected to merged vertex
    # a: Iterate through the vertices you want merged and for each, go through it's adjacency
    #   list. Each edge in there is to be deleted, also track the vertices, since they will
    #   be added to vmerge, then delete the vertices, and add vmerge + extra edges.
    # t:
    # p: (Array, String)
    #   array is the string names of vertices to merge together
    #   string is the name of the final vertex
    #    (String, String, String)
    #   first two strings are the vertices to merge together
    #   last string is the name of the merged vertex
    # r: the graph itself
    # *: the edges prioritize v1 to v2 if there are any conflicts
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

      # go through vertex adjacency lists, and delete any bad vertices!
      # at the same time, keep track of the connections vmerged will be merged with
      finalConnections = {}
      # go in reverse to prioritize the edges that are earlier in the array
      mergeV.reverse.each do |vertex|
        @graph_impl.adjacency_list( vertex ).each do |v,e|
          if mergeV.include? v
            delete_edge! e
            next
          end
          finalConnections[v] = e
          delete_edge! e
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
