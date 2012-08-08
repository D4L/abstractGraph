require 'spec_helper'

describe AbstractGraph::Composition::Vertex do
  describe "#new" do

    it "returns an object of class Vertex" do
      AbstractGraph::Composition::Vertex.new.class.should == AbstractGraph::Composition::Vertex
    end

  end
end
