# required in "abstract_graph/graph/template"

module AbstractGraph
  class Graph
    class << self

      # create a variabled sized complete graph
      #   that is, a graph where every vertex is adjacent
      #   to every other vertex
      # p: the number of vertices in the desired complete graph
      def complete_graph n
        result = new
        vertexNames = n.times.collect { |i| 2**i }
        vertexNames.each do |i|
          result.add_vertex "v#{i}"
        end
        vertexNames.combination(2).each do |i|
          result.add_edge( "e#{i[0]+i[1]}", "v#{i[0]}", "v#{i[1]}" )
        end
        result
      end

    end
  end
end
