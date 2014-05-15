# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # d: Split a vertex into two and assign adjacent to each of the vertices.
    # a: Uses the adjacency list delete the vertex and all the adjacent edges.
    #   Then goes back, creates two vertices, and recreates all the adjacent edges.
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
      adjacency_list = @graph_impl.adjacency_list s

      adjacency_list.each do |v, e|
        delete_edge! e
      end
      delete_vertex! s

      add_vertex "#{s}-1"
      add_vertex "#{s}-2"
      adjacency_list.each do |v, e|
        add_edge "#{e}-1",  "#{s}-1", v
        add_edge "#{e}-2",  "#{s}-2", v
      end

      self
    end

  end
end
