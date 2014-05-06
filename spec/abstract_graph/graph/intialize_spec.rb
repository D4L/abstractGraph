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
        @graph = Graph.new(implementation: :adjacency_list)
        @graph.implementation.should eq(:adjacency_list)
      end

      it "sets the default implementation to adjacency_list" do
        @graph.implementation.should eq(:adjacency_list)
      end

      it "throws an error when initialized with bad implementation" do
        expect do
          Graph.new implementation: :bogey
        end.to raise_error
      end

    end
  end
end
