require 'spec_helper'

module AbstractGraph

  shared_examples "add_edge(String, String, String)" do

    before :each do
      @vertex1 = "Vertex1"
      @vertex2 = "Vertex2"
      @vertex3 = "Vertex3"
      subject.add_vertex @vertex1
      subject.add_vertex @vertex2
      subject.add_vertex @vertex3
    end

    it "returns an object of class Graph" do
      subject.add_edge( "MyEdge", @vertex1, @vertex2 ).should be_an_instance_of(Graph)
    end

    it "throws an exception when adding edge of existing name" do
      subject.add_edge( "MyEdge", @vertex1, @vertex2 ).should be_an_instance_of(Graph)
      expect { subject.add_edge( "MyEdge", @vertex1, @vertex3 ) }.to raise_error
      expect { subject.add_edge( @vertex1, @vertex1, @vertex3) }.to raise_error
    end

    it "doesn't allow an edge to be a loop" do
      expect { subject.add_edge( "MyEdge", @vertex1, @vertex1 ) }.to raise_error
    end

    it "doesn't allow multiple edges" do
      subject.add_edge( "MyEdge", @vertex1, @vertex2 )
      expect { subject.add_edge( "MyEdge2", @vertex1, @vertex2 ) }.to raise_error
    end

    it "returns nil if any of the vertices don't exist" do
      subject.add_edge( "MyEdge", @vertex1, "randomString" ).should be_nil
      subject.add_edge( "MyEdge", "randomString", @vertex1 ).should be_nil
      subject.has_edge?("MyEdge").should be_false
    end

  end

end
