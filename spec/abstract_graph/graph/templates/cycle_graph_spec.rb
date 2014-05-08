require 'spec_helper'

module AbstractGraph
  describe Graph do

    describe ".cycle_graph(Integer)" do

      before :all do
        @n = 6
        @graphncycle = Graph.cycle_graph @n, implementation: :naive
        @graph10cycle = Graph.cycle_graph 10, implementation: :naive
      end

      it "retuns an object of class Graph" do
        Graph.complete_graph(1, implementation: :naive).should be_an_instance_of(Graph)
      end

      it "creates as many vertices as the integer, named with powers of two" do
        @n.times do |i|
          @graphncycle.has_vertex?("v#{2**i}").should be_true
        end
        @graph10cycle.has_vertex?("v#{2**9}").should be_true
      end

      it "ensures each vertex is adjacent to two other vertices" do
        @n.times do |i|
          @graphncycle.adjacency_list("v#{2**i}").size.should eql(2)
        end
      end

      #TODO: Write some path specific tests

    end

  end
end
