require 'spec_helper'

module AbstractGraph
  module Composition
    describe Graph do

      before :all do
        @vertex1 = "Vertex1"
        @vertex2 = "Vertex2"
        @vertex3 = "Vertex3"
        @edge1 = "Edge1"
        @edge2 = "Edge2"
      end

      before :each do
        @graph = Graph.new
        @graph.add_vertex @vertex1
        @graph.add_vertex @vertex2
        @graph.add_vertex @vertex3
        @graph.add_edge @edge1, @vertex1, @vertex2
        @graph.add_edge @edge2, @vertex2, @vertex3
      end

      describe "#is_adjacent?(String,String)" do

        it "returns true if two vertices are joined with an edge" do
          @graph.is_adjacent?( @vertex1, @vertex2 ).should be_true
        end

        it "returns false if two vertices are not joined with an edge" do
          @graph.is_adjacent?( @vertex1, @vertex3 ).should be_false
        end

      end

    end
  end
end
