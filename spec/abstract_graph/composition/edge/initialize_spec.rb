require 'spec_helper'

module AbstractGraph
  module Composition
    describe Edge do

      before :all do
        @v1 = Vertex.new "v1"
        @v2 = Vertex.new "v2"
      end

      describe "#new(Vertex, Vertex)" do

        before :each do
          @edge = Edge.new( @v1, @v2 )
        end

        it "returns an object of class Edge" do
          @edge.should be_an_instance_of(Edge)
        end

      end

      describe "#new(String, Vertex, Vertex)" do

        before :each do
          @edge = Edge.new("e1", @v1, @v2)
        end

        it "allows vertices to be initiated with a string name" do
          @edge.should_not be_nil
        end

      end

    end
  end
end
