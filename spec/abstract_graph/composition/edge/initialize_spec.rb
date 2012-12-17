require 'spec_helper'

describe AbstractGraph::Composition::Edge do

  before :all do
    AbstractGraph::Composition::Vertex.class_variable_set :@@names, []
    @v1 = AbstractGraph::Composition::Vertex.new "v1"
    @v2 = AbstractGraph::Composition::Vertex.new "v2"
  end

  describe "#new(Vertex, Vertex)" do

    before :each do
      @edge = AbstractGraph::Composition::Edge.new( @v1, @v2 )
    end

    it "returns an object of class Edge" do
      @edge.should be_an_instance_of(AbstractGraph::Composition::Edge)
    end

  end

  describe "#new(String, Vertex, Vertex)" do

    before :each do
      @edge = AbstractGraph::Composition::Edge.new("e1", @v1, @v2)
    end

    it "allows vertices to be initiated with a string name" do
      @edge.should_not be_nil
    end

  end

end
