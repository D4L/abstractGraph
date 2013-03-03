# required in "abstract_graph/graph"

module AbstractGraph
  class Graph

    # returns the edge connecting v1 and v2, if there is no
    #   edge, then it returns nil
    # p: String v1, v2 represents the names of the vertices
    def get_edge_name( v1, v2 )
      vertices = [v1, v2].sort!

      @edges.each_value do |e|
        eVertices = e.vertices.map do |v|
          v.name
        end.sort

        return e.name if eVertices == vertices
      end

      nil
    end

  end
end
