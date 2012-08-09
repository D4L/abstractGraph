require 'spec_helper'

describe AbstractGraph::Graph do
  describe "#new" do

    before(:each) do
      @graph = AbstractGraph::Graph.new
    end

    it "returns an object of class Graph" do
      @graph.class.should == AbstractGraph::Graph
    end

  end
end
