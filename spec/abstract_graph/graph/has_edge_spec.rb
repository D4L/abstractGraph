require 'spec_helper'

module AbstractGraph
  module Composition
    describe Graph do

      before :each do
        @vertex1 = "Vertex1"
        @vertex2 = "Vertex2"
        @graph = Graph.new
        @graph.add_vertex @vertex1
        @graph.add_vertex @vertex2
      end

      describe "#has_edge?(String)" do

        it "returns whether the string name is a named edge in the graph" do
          @graph.add_edge( "MyEdge", @vertex1, @vertex2 )
          @graph.has_edge?( "MyEdge" ).should be_true
        end

        it "returns false when the string is not a named edge" do
          @graph.has_edge?( "MyVertex" ).should be_false
          @graph.has_edge?( "AlsoFalse" ).should_not be_nil
        end

      end

    end
  end
end
