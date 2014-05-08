require 'spec_helper'

module AbstractGraph

  shared_examples "adjacency_list(String)" do

    before :all do
      @vertex1 = "Vertex1"
      @vertex2 = "Vertex2"
      @vertex3 = "Vertex3"
      @vertex4 = "Vertex4"
      @edge1 = "Edge1"
      @edge2 = "Edge2"
    end

    before :each do
      subject.add_vertex @vertex1
      subject.add_vertex @vertex2
      subject.add_vertex @vertex3
      subject.add_vertex @vertex4
      subject.add_edge @edge1, @vertex1, @vertex2
      subject.add_edge @edge2, @vertex2, @vertex3
    end

    it "returns an array if there are adjacent vertices" do
      subject.adjacency_list( @vertex1 ).should be_an_instance_of(Hash)
    end

    it "returns nil if there are no adjacent vertices" do
      subject.adjacency_list( @vertex4).should be_nil
    end

    it "returns the vertices that are connected with edges" do
      subject.adjacency_list( @vertex2 ).should include(@vertex1)
      subject.adjacency_list( @vertex2 ).should include(@vertex3)
      subject.adjacency_list( @vertex1 ).should include(@vertex2)
    end

    it "returns the edges that are connected to the vertex" do
      subject.adjacency_list( @vertex2 ).values.should include(@edge1)
      subject.adjacency_list( @vertex2 ).values.should include(@edge2)
      subject.adjacency_list( @vertex1 ).values.should include(@edge1)
    end

  end

end
