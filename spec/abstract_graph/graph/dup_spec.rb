require 'spec_helper'

module AbstractGraph
  module Composition
    describe Graph do

      before :each do
        @graph = Graph.new
        @graph.add_vertex "MyVertex"
      end

      describe "#dup" do

        it "returns a graph object" do
          @graph.dup.should be_an_instance_of(Graph)
        end

        it "has a different id than the original graph" do
          @graph.object_id.should_not == @graph.dup.object_id
        end

        it "copies over the existing vertices" do
          graphdup = @graph.dup
          graphdup.has_vertex?( "MyVertex" ).should be_true
        end

        it "will not modify the original if it is modified" do
          graphdup = @graph.dup
          graphdup.vertices.clear
          @graph.vertices.size.should == 1
        end

      end

    end
  end
end