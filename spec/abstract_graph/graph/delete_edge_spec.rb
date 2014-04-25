require 'spec_helper'

module AbstractGraph

  shared_examples "delete_edge(String)" do

    before :all do
      @vertex1 = "Vertex1"
      @vertex2 = "Vertex2"
      @edge = "MyEdge"
    end

    before :each do
      subject.add_vertex @vertex1
      subject.add_vertex @vertex2
      subject.add_edge @edge, @vertex1, @vertex2
    end

    it "returns an object of class Graph" do
      subject.delete_edge( @edge ).should be_an_instance_of(Graph)
    end

    it "returns an object without the edge" do
      nextGraph = subject.delete_edge( @edge )
      nextGraph.has_edge?( @edge ).should be_false
    end

    it "does not modify the original graph" do
      subject.delete_edge( @edge )
      subject.has_edge?( @edge ).should be_true
    end

  end

  shared_examples "delete_edge!(String)" do

    before :all do
      @vertex1 = "Vertex1"
      @vertex2 = "Vertex2"
      @edge = "MyEdge"
    end

    before :each do
      subject.add_vertex @vertex1
      subject.add_vertex @vertex2
      subject.add_edge @edge, @vertex1, @vertex2
    end

    it "returns an object of class Graph" do
      subject.delete_edge!( @edge ).should be_an_instance_of(Graph)
    end

    it "returns an object without the edge" do
      nextGraph = subject.delete_edge!( @edge )
      nextGraph.has_edge?( @edge ).should be_false
    end

    it "removes the edge from the original graph" do
      subject.delete_edge!( @edge )
      subject.has_edge?( @edge ).should be_false
    end

  end

end
