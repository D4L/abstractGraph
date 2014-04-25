require 'spec_helper'

module AbstractGraph

  shared_examples "change_edge_name(String,String)" do

    before :all do
      @vertex1 = "Vertex1"
      @vertex2 = "Vertex2"
      @vertex3 = "Vertex3"
      @edge = "MyEdge"
      @edgechanged = "MyChangedName"
    end

    before :each do
      subject.add_vertex @vertex1
      subject.add_vertex @vertex2
      subject.add_vertex @vertex3
      subject.add_edge @edge, @vertex1, @vertex2
    end

    it "returns an object of class Graph" do
      subject.change_edge_name( @edge, @edgechanged ).should be_an_instance_of(Graph)
    end

    it "changes the name of the vertex" do
      subject.change_edge_name @edge, @edgechanged
      subject.has_edge?( @edge ).should be_false
      subject.has_edge?( @edgechanged ).should be_true
    end

    it "throws an exception if the name has already been taken" do
      subject.add_edge @edgechanged, @vertex2, @vertex3
      expect { subject.change_edge_name( @edge, @edgechanged ) }.to raise_error
    end

  end

end
