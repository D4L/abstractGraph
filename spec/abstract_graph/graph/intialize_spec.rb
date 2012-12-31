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

    end
  end
end
