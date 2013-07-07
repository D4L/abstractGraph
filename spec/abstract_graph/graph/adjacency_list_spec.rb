require 'spec_helper'

module AbstractGraph
  describe Graph do

    before :all do
      @vertex1 = "Vertex1"
      @vertex2 = "Vertex2"
      @vertex3 = "Vertex3"
      @vertex4 = "Vertex4"
      @edge1 = "Edge1"
      @edge2 = "Edge2"
    end

    before :each do
      @graph = Graph.new
      @graph.add_vertex @vertex1
      @graph.add_vertex @vertex2
      @graph.add_vertex @vertex3
      @graph.add_vertex @vertex4
      @graph.add_edge @edge1, @vertex1, @vertex2
      @graph.add_edge @edge2, @vertex2, @vertex3
    end

    describe "#adjacency_list(String)" do

      it "returns an array if there are adjacent vertices" do
        @graph.adjacency_list( @vertex1 ).should be_an_instance_of(Array)
      end

      it "returns nil if there are no adjacent vertices" do
        @graph.adjacency_list( @vertex4).should be_nil
      end

      it "returns the vertices that are connected with edges" do
        @graph.adjacency_list( @vertex2 ).should include(@vertex1)
        @graph.adjacency_list( @vertex2 ).should include(@vertex3)
        @graph.adjacency_list( @vertex1 ).should include(@vertex2)
      end

    end

  end
end
