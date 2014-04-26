require 'spec_helper'

module AbstractGraph
  describe Graph do
    describe "#new" do

      before(:each) do
        @graph = Graph.new
      end

      it "returns an object of class Graph" do
        @graph.class.should == Graph
      end

      it "allows passing in implementation" do
        pending "Need to do adjacency list"
        @graph = Graph.new(implementation: :adjacency_list)
        @graph.implementation.should eq(:adjacency_list)
      end

      it "sets the default implementation to adjacency_list" do
        pending "Need to do adjacency list"
        @graph.implementation.should eq(:adjacency_list)
      end

    end
  end
end
