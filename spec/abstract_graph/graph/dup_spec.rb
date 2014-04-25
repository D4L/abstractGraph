require 'spec_helper'

module AbstractGraph

  shared_examples "dup" do

    before :each do
      subject.add_vertex "MyVertex"
      subject.add_vertex "MyOtherVertex"
      subject.add_edge "MyEdge", "MyVertex", "MyOtherVertex"
    end

    it "returns a graph object" do
      subject.dup.should be_an_instance_of(Graph)
    end

    it "has a different id than the original graph" do
      subject.object_id.should_not == subject.dup.object_id
    end

    it "copies over the existing vertices" do
      graphdup = subject.dup
      graphdup.has_vertex?( "MyVertex" ).should be_true
    end

    it "copies over the existing edges" do
      graphdup = subject.dup
      graphdup.has_edge?( "MyEdge" ).should be_true
    end

    it "will not modify the original if it is modified" do
      graphdup = subject.dup
      graphdup.vertices.clear
      subject.vertices.size.should == 2
    end

  end

end
