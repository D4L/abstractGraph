require 'spec_helper'

describe AbstractGraph::Graph, "#new" do

  it "returns an object of class Graph" do
    AbstractGraph::Graph.new.class.should == AbstractGraph::Graph
  end

end
