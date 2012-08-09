require 'spec_helper'

describe AbstractGraph::Composition::Vertex do
  describe "#new" do

    before (:each) do
      @vertex = AbstractGraph::Composition::Vertex.new
    end

    it "returns an object of class Vertex" do
      @vertex.should be_an_instance_of(AbstractGraph::Composition::Vertex)
    end

  end

  describe "#new(String)" do

    before (:each) do
      @vertex = AbstractGraph::Composition::Vertex.new("v1")
    end

    it "allows vertices to be initiated with a string name" do
      @vertex.should_not be_nil
    end

  end

end
