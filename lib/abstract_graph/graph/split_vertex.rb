# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # returns a replicated graph where all the vertices are the same but one
    #   gets split and all it's adjacent vertices are now connected to two replaced vertices
    # p: String s the name of the vertex that will be split into vertexName-1 and vertexName-2
    #     all adjacent edges will also be split and adjacent to the correct vertex
    def split_vertex( s )
      other = self.dup
      other.split_vertex!( s )
      other
    end

    # same as before except operates on the current graph
    def split_vertex!( s )
      adjacentVertices = @edges.dup.keep_if do |e|
        e.vertices.collect(&:name).include? s
      end.collect do |e|
        [ e.name, ( e.vertices.collect(&:name) - [s] )[0] ]
      end

      delete_vertex! s
      adjacentVertices.each do |e|
        delete_edge! e[0]
      end

      add_vertex "#{s}-1"
      add_vertex "#{s}-2"
      adjacentVertices.each do |e|
        add_edge "#{e[0]}-1",  "#{s}-1", e[1]
        add_edge "#{e[0]}-2",  "#{s}-2", e[1]
      end

      self
    end

  end
end
