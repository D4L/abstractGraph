require 'spec_helper'

module AbstractGraph

  shared_examples "is_adjacent?(String,String)" do

    before :all do
      @vertex1 = "Vertex1"
      @vertex2 = "Vertex2"
      @vertex3 = "Vertex3"
      @edge1 = "Edge1"
      @edge2 = "Edge2"
    end

    before :each do
      subject.add_vertex @vertex1
      subject.add_vertex @vertex2
      subject.add_vertex @vertex3
      subject.add_edge @edge1, @vertex1, @vertex2
      subject.add_edge @edge2, @vertex2, @vertex3
    end

    it "returns true if two vertices are joined with an edge" do
      subject.is_adjacent?( @vertex1, @vertex2 ).should be_true
    end

    it "returns false if two vertices are not joined with an edge" do
      subject.is_adjacent?( @vertex1, @vertex3 ).should be_false
    end

  end

end
