require 'spec_helper'

module AbstractGraph
  module Composition
    describe Graph do

      before :all do
        # we're building a 4-cycle!
        @v1 = "v1"
        @v2 = "v2"
        @v3 = "v3"
        @v4 = "v4"
        @vmerged = "vMerged"
        @e1 = "e1"
        @e2 = "e2"
        @e3 = "e3"
        @e4 = "e4"
      end

      before :each do
        @g = Graph.new
        @g.add_vertex @v1
        @g.add_vertex @v2
        @g.add_vertex @v3
        @g.add_vertex @v4
        @g.add_edge @e1, @v1, @v2
        @g.add_edge @e2, @v2, @v3
        @g.add_edge @e3, @v3, @v4
        @g.add_edge @e4, @v4, @v1
      end

      describe "#merge_vertices(String,String,String)" do

        it "returns an object of type graph" do
          @g.merge_vertices( @v1, @v2, @vmerged ).should be_an_instance_of(Graph)
        end

        it "does not modify the original graph" do
          @g.merge_vertices @v1, @v2, @vmerged
          @g.has_vertex?( @v1 ).should be_true
          @g.has_vertex?( @v2 ).should be_true
        end

        it "removes the first two vertices" do
          @gnext = @g.merge_vertices @v1, @v2, @vmerged
          @gnext.has_vertex?( @v1 ).should be_false
          @gnext.has_vertex?( @v2 ).should be_false
        end

        it "creates a vertex of the third string" do
          @gnext = @g.merge_vertices @v1, @v2, @vmerged
          @gnext.has_vertex?( @vmerged ).should be_true
        end

        it "removes the edge connecting the two vertices" do
          @gnext = @g.merge_vertices @v1, @v2, @vmerged
          @gnext.has_edge?( @e1 ).should be_false
        end

        it "connects the merged vertex with the vertices adjacent to the previous two" do
          @gnext = @g.merge_vertices @v1, @v2, @vmerged
          @gnext.is_adjacent?( @vmerged, @v3 ).should be_true
          @gnext.is_adjacent?( @vmerged, @v4 ).should be_true
          @gnext = @g.merge_vertices @v1, @v3, @vmerged
          @gnext.is_adjacent?( @vmerged, @v2 ).should be_true
          @gnext.is_adjacent?( @vmerged, @v4 ).should be_true
        end

        it "preserves the edges of the first vertex over the second" do
          @gnext = @g.merge_vertices @v1, @v3, @vmerged
          @gnext.has_edge?( @e1 ).should be_true
          @gnext.has_edge?( @e2 ).should be_false
          @gnext.has_edge?( @e3 ).should be_false
          @gnext.has_edge?( @e4 ).should be_true
        end

      end

      describe "#merge_vertices!(String,String,String)" do

        it "returns an object of type graph" do
          @g.merge_vertices!( @v1, @v2, @vmerged ).should be_an_instance_of(Graph)
        end

        it "modifies the original graph" do
          @g.merge_vertices! @v1, @v2, @vmerged
          @g.has_vertex?( @v1 ).should be_false
          @g.has_vertex?( @v2 ).should be_false
        end

        it "removes the first two vertices" do
          @g.merge_vertices! @v1, @v2, @vmerged
          @g.has_vertex?( @v1 ).should be_false
          @g.has_vertex?( @v2 ).should be_false
        end

        it "creates a vertex of the third string" do
          @g.merge_vertices! @v1, @v2, @vmerged
          @g.has_vertex?( @vmerged ).should be_true
        end

        it "removes the edge connecting the two vertices" do
          @g.merge_vertices! @v1, @v2, @vmerged
          @g.has_edge?( @e1 ).should be_false
        end

        it "connects the merged vertex with the vertices adjacent to the previous two" do
          @g.merge_vertices! @v1, @v3, @vmerged
          @g.is_adjacent?( @vmerged, @v2 ).should be_true
          @g.is_adjacent?( @vmerged, @v4 ).should be_true
        end

        it "preserves the edges of the first vertex over the second" do
          @g.merge_vertices! @v1, @v3, @vmerged
          @g.has_edge?( @e1 ).should be_true
          @g.has_edge?( @e2 ).should be_false
          @g.has_edge?( @e3 ).should be_false
          @g.has_edge?( @e4 ).should be_true
        end

      end

      describe "#merge_vertices(Array,String)" do

        it "deletes the vertices in the array" do
          arr = [ @v1, @v2 ]
          @gnext = @g.merge_vertices( arr, @vmerged )
          arr.each do |v|
            @gnext.has_vertex?( v ).should be_false
          end
        end

        it "removes the edges connecting the vertices in the array" do
          arrV = [ @v1, @v2, @v3 ]
          arrE = [ @e1, @e2 ]
          @gnext = @g.merge_vertices( arrV, @vmerged )
          arrE.each do |e|
            @gnext.has_edge?( e ).should be_false
          end
        end

        it "connects the merged vertex with the vertices in the array" do
          arr = [ @v1, @v3 ]
          @gnext = @g.merge_vertices( arr, @vmerged )
          [ @v2, @v4 ].each do |v|
            @gnext.is_adjacent?( @vmerged, v ).should be_true
          end
        end

        it "preserves the edges of earlier vertices than later" do
          arr = [ @v1, @v3 ]
          @gnext = @g.merge_vertices( arr, @vmerged )
          @gnext.has_edge?( @e1 ).should be_true
          @gnext.has_edge?( @e2 ).should be_false
          @gnext.has_edge?( @e3 ).should be_false
          @gnext.has_edge?( @e4 ).should be_true
        end

      end

      describe "#merge_vertices!(Array,String)" do

        it "deletes the vertices in the array" do
          arr = [ @v1, @v2 ]
          @g.merge_vertices!( arr, @vmerged )
          arr.each do |v|
            @g.has_vertex?( v ).should be_false
          end
        end

        it "removes the edges connecting the vertices in the array" do
          arrV = [ @v1, @v2, @v3 ]
          arrE = [ @e1, @e2 ]
          @g.merge_vertices!( arrV, @vmerged )
          arrE.each do |e|
            @g.has_edge?( e ).should be_false
          end
        end

        it "connects the merged vertex with the vertices in the array" do
          arr = [ @v1, @v3 ]
          @g.merge_vertices!( arr, @vmerged )
          [ @v2, @v4 ].each do |v|
            @g.is_adjacent?( @vmerged, v ).should be_true
          end
        end

        it "preserves the edges of earlier vertices than later" do
          arr = [ @v1, @v3 ]
          @g.merge_vertices!( arr, @vmerged )
          @g.has_edge?( @e1 ).should be_true
          @g.has_edge?( @e2 ).should be_false
          @g.has_edge?( @e3 ).should be_false
          @g.has_edge?( @e4 ).should be_true
        end

      end

    end
  end
end
