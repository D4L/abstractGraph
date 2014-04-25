require 'spec_helper'

module AbstractGraph

  shared_examples "has_edge?(String)" do

    before :each do
      @vertex1 = "Vertex1"
      @vertex2 = "Vertex2"
      subject.add_vertex @vertex1
      subject.add_vertex @vertex2
    end

    it "returns whether the string name is a named edge in the graph" do
      subject.add_edge( "MyEdge", @vertex1, @vertex2 )
      subject.has_edge?( "MyEdge" ).should be_true
    end

    it "returns false when the string is not a named edge" do
      subject.has_edge?( "MyVertex" ).should be_false
      subject.has_edge?( "AlsoFalse" ).should_not be_nil
    end

  end

end
