require 'spec_helper'

module AbstractGraph
  module Composition
    describe Graph do

      before :all do
        @v1       = "v1"
        @v2       = "v2"
        @v3       = "v3"
        @v4       = "v4"
        @vsplit1  = "v1-1"
        @vsplit2  = "v1-2"
        @e1       = "e1"
        @e2       = "e2"
        @e3       = "e3"
        @e4       = "e4"
        @esplit1  = "e1-1"
        @esplit2  = "e1-2"
      end

      before :each do
        @g5path   = Graph.path_graph 5
        @g = Graph.new
        @g.add_vertex @v1
        @g.add_vertex @v2
        @g.add_vertex @v3
        @g.add_vertex @v4
        @g.add_edge   @e1, @v1, @v2
        @g.add_edge   @e2, @v2, @v3
        @g.add_edge   @e3, @v3, @v4
        @g.add_edge   @e4, @v4, @v2
      end

      describe "#split_vertex(String)" do

        it "returns an object of type graph" do
          @g.split_vertex(@v1).should be_an_instance_of(Graph)
        end

        it "does not modify the original graph" do
          @g.split_vertex(@v1)
          @g.has_vertex?( @v1 ).should be_true
          @g.has_vertex?( @v2 ).should be_true
          @g.has_edge?( @v1 ).should be_true
          @g.has_vertex?( @vsplit1 ).should be_false
          @g.has_vertex?( @vsplit2 ).should be_false
          @g.has_edge?( @esplit1 ).should be_false
        end

        it "removes the original vertex and adjacent edges" do
          @gnext = @g.split_vertex @v1
          @gnext.has_vertex?( @v1 ).should be_false
          @gnext.has_edge?( @e1 ).should be_false
        end

        it "adds split versions of the original vertex and adjacent edges" do
          @gnext = @g.split_vertex @v1
          @gnext.has_vertex?( @vsplit1 ).should be_true
          @gnext.has_vertex?( @vsplit2 ).should be_true
          @gnext.has_edge?( @esplit1 ).should be_true
          @gnext.has_edge?( @esplit2 ).should be_true
        end

        it "connects the split vertices with previous adjacent vertices" do
          @gnext = @g.split_vertex @v1
          @gnext.is_adjacent?( @vsplit1, @v2 ).should be_true
          @gnext.is_adjacent?( @vsplit2, @v2 ).should be_true

          @gnext = @g5path.split_vertex "v4"
          @gnext.is_adjacent?( "v4-1", "v2" ).should be_true
          @gnext.is_adjacent?( "v4-2", "v2" ).should be_true
          @gnext.is_adjacent?( "v4-1", "v8" ).should be_true
          @gnext.is_adjacent?( "v4-2", "v8" ).should be_true
        end

      end

    end
  end
end
