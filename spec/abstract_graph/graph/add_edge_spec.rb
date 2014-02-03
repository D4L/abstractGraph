require 'spec_helper'

module AbstractGraph
  describe Graph do

    before :each do
      @vertex1 = "Vertex1"
      @vertex2 = "Vertex2"
      @vertex3 = "Vertex3"
      @graph = Graph.new
      @graph.add_vertex @vertex1
      @graph.add_vertex @vertex2
      @graph.add_vertex @vertex3
    end

    describe "#add_edge(String, String, String)" do

      it "returns an object of class Graph" do
        @graph.add_edge( "MyEdge", @vertex1, @vertex2 ).should be_an_instance_of(Graph)
      end

      it "throws an exception when adding edge of existing name" do
        @graph.add_edge( "MyEdge", @vertex1, @vertex2 ).should be_an_instance_of(Graph)
        expect { @graph.add_edge( "MyEdge", @vertex1, @vertex3 ) }.to raise_error
        expect { @graph.add_edge( @vertex1, @vertex1, @vertex3) }.to raise_error
      end

      it "doesn't allow an edge to be a loop" do
        expect { @graph.add_edge( "MyEdge", @vertex1, @vertex1 ) }.to raise_error
      end

      it "doesn't allow multiple edges" do
        @graph.add_edge( "MyEdge", @vertex1, @vertex2 )
        expect { @graph.add_edge( "MyEdge2", @vertex1, @vertex2 ) }.to raise_error
      end

      it "returns nil if any of the vertices don't exist" do
        @graph.add_edge( "MyEdge", @vertex1, "randomString" ).should be_nil
        @graph.add_edge( "MyEdge", "randomString", @vertex1 ).should be_nil
        @graph.edges.collection["MyEdge"].should be_nil
      end

    end

  end
end
