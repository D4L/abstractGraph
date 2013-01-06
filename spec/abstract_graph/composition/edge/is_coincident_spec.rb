require 'spec_helper'

module AbstractGraph
  module Composition
    describe Edge do

      before :all do
        @v1 = Vertex.new "v1"
        @v2 = Vertex.new "v2"
        @v3 = Vertex.new "v3"
      end

      before :each do
        @edge = Edge.new( "e1", @v1, @v2 )
      end

      describe "#is_coincident?(Edge)" do

        it "returns true if it joins the same two vertices" do
          edge2 = Edge.new( "e2", @v1, @v2 )
          @edge.is_coincident?( edge2 ).should be_true
        end

        it "returns false if the two edges span >= 3 vertices" do
          edge2 = Edge.new( "e2", @v1, @v3 )
          @edge.is_coincident?( edge2 ).should be_false
        end

      end

    end
  end
end
