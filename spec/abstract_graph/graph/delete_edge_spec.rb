require 'spec_helper'

module AbstractGraph
  describe Graph do

    before :all do
      @vertex1 = "Vertex1"
      @vertex2 = "Vertex2"
      @edge = "MyEdge"
    end

    before :each do
      @graph = Graph.new
      @graph.add_vertex @vertex1
      @graph.add_vertex @vertex2
      @graph.add_edge @edge, @vertex1, @vertex2
    end

    describe "#delete_edge(String)" do

      it "returns an object of class Graph" do
        @graph.delete_edge( @edge ).should be_an_instance_of(Graph)
      end

      it "returns an object without the edge" do
        nextGraph = @graph.delete_edge( @edge )
        nextGraph.has_edge?( @edge ).should be_false
      end

      it "does not modify the original graph" do
        @graph.delete_edge( @edge )
        @graph.has_edge?( @edge ).should be_true
      end

    end

    describe "#delete_edge!(String)" do

      it "returns an object of class Graph" do
        @graph.delete_edge!( @edge ).should be_an_instance_of(Graph)
      end

      it "returns an object without the edge" do
        nextGraph = @graph.delete_edge!( @edge )
        nextGraph.has_edge?( @edge ).should be_false
      end

      it "removes the edge from the original graph" do
        @graph.delete_edge!( @edge )
        @graph.has_edge?( @edge ).should be_false
      end

    end

  end
end
