require 'spec_helper'

module AbstractGraph
  module Composition
    describe Graph do

      before :all do
        # create the 3-path
        @v1 = "v1"
        @v2 = "v2"
        @v3 = "v3"
        @e1 = "e1"
        @e2 = "e2"
      end

      before :each do
        @graph = Graph.new
        @graph.add_vertex @v1
        @graph.add_vertex @v2
        @graph.add_vertex @v3
        @graph.add_edge @e1, @v1, @v2
        @graph.add_edge @e2, @v3, @v2
      end

      describe "#get_edge_name(String,String)" do

        it "returns the name of the edge connecting the two string vertices" do
          @graph.get_edge_name( @v1, @v2 ).should eql(@e1)
          @graph.get_edge_name( @v2, @v3 ).should eql(@e2)
        end

        it "returns nil if the two vertices are not adjacent" do
          @graph.get_edge_name( @v1, @v3).should be_nil
        end

      end

    end
  end
end
