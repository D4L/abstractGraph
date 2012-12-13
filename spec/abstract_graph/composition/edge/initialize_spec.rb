require 'spec_helper'

describe AbstractGraph::Composition::Edge do

  describe "#new" do

    before :each do
      @edge = AbstractGraph::Composition::Edge.new
    end

    it "returns an object of class Edge" do
      @edge.should be_an_instance_of(AbstractGraph::Composition::Edge)
    end

  end

  describe "#new(String)" do
    before :each do
      @edge = AbstractGraph::Composition::Edge.new("e1")
    end

    it "allows vertices to be initiated with a string name" do
      @edge.should_not be_nil
    end

  end

end
