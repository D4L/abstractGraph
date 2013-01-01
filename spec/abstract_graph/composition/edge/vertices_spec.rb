require 'spec_helper'

module AbstractGraph
  module Composition
    describe Edge do

      before :all do
        @v1 = Vertex.new "v1"
        @v2 = Vertex.new "v2"
        @edge = Edge.new( @v1, @v2 )
      end

      describe "#vertices" do

        it "should be an enumerable" do
          @edge.vertices.should be_an_instance_of(Array)
        end

        it "must be two vertices" do
          @edge.vertices.should have(2).vertices
        end

        it "is the vertices passed from constructor" do
          @edge.vertices.should include( @v1 )
          @edge.vertices.should include( @v2 )
        end

      end

    end
  end
end
