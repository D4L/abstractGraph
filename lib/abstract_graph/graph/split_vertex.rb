# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # d: Split a vertex into two and assign adjacent to each of the vertices.
    # a: Gathers a list of adjacent vertices by going through the edges, then
    #   deletes the vertex and all the adjacent edges. Then goes back, creates
    #   two vertices, and recreates all the adjacent edges.
    # t: |edges|
    # p: name of vertex to split
    # r: graph itself
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
