require 'spec_helper'

describe AbstractGraph::Composition::Vertex do

  before :each do
    AbstractGraph::Composition::Vertex.class_variable_set :@@names, []
  end

  describe "#delete" do

    it "removes the name of the vertex in the namespace" do
      vertex = AbstractGraph::Composition::Vertex.new("v1")
      vertex.delete
      AbstractGraph::Composition::Vertex.class_variable_get(:@@names).should eql([])
    end

  end
end
