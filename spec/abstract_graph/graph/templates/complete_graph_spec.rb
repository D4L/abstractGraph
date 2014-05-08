require 'spec_helper'

module AbstractGraph
  describe Graph do

    describe ".complete_graph(Integer)" do

      before :all do
        @n = 5
        @graphkn = Graph.complete_graph @n, implementation: :naive
        @graphk10 = Graph.complete_graph 10, implementation: :naive
      end

      it "returns an object of class Graph" do
        Graph.complete_graph(1, implementation: :naive).should be_an_instance_of(Graph)
      end

      it "creates as many vertices as the integer, named with powers of two" do
        @n.times do |i|
          @graphkn.has_vertex?("v#{2**i}").should be_true
        end
        @graphk10.has_vertex?("v#{2**9}").should be_true
      end

      it "creates an edge between each vertex" do
        n = @n.times.collect { |i| 2**i }
        n.combination(2).each do |i|
          @graphkn.has_edge?("e#{i[0]+i[1]}").should be_true
        end
        @graphk10.has_edge?("e768").should be_true
      end

    end

  end
end
