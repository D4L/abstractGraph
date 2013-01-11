require 'spec_helper'

module AbstractGraph
  describe Graph do

    before :all do
      @vertex1 = "Vertex1"
      @vertex2 = "Vertex2"
      @vertex3 = "Vertex3"
      @edge = "MyEdge"
      @edgechanged = "MyChangedName"
    end

    before :each do
      @graph = Graph.new
      @graph.add_vertex @vertex1
      @graph.add_vertex @vertex2
      @graph.add_vertex @vertex3
      @graph.add_edge @edge, @vertex1, @vertex2
    end

    describe "#change_edge_name(String,String)" do

      it "returns an object of class Graph" do
        @graph.change_edge_name( @edge, @edgechanged ).should be_an_instance_of(Graph)
      end

      it "changes the name of the vertex" do
        @graph.change_edge_name @edge, @edgechanged
        @graph.has_edge?( @edge ).should be_false
        @graph.has_edge?( @edgechanged ).should be_true
      end

      it "throws an exception if the name has already been taken" do
        @graph.add_edge @edgechanged, @vertex2, @vertex3
        expect { @graph.change_edge_name( @edge, @edgechanged ) }.to raise_error
      end

    end

  end
end
