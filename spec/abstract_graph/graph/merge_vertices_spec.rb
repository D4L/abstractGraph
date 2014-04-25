require 'spec_helper'

module AbstractGraph

  shared_examples "merge_vertices(String,String,String)" do

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
      subject.add_vertex @v1
      subject.add_vertex @v2
      subject.add_vertex @v3
      subject.add_vertex @v4
      subject.add_edge @e1, @v1, @v2
      subject.add_edge @e2, @v2, @v3
      subject.add_edge @e3, @v3, @v4
      subject.add_edge @e4, @v4, @v1
    end

    it "returns an object of type graph" do
      subject.merge_vertices( @v1, @v2, @vmerged ).should be_an_instance_of(Graph)
    end

    it "does not modify the original graph" do
      subject.merge_vertices @v1, @v2, @vmerged
      subject.has_vertex?( @v1 ).should be_true
      subject.has_vertex?( @v2 ).should be_true
    end

    it "removes the first two vertices" do
      gnext = subject.merge_vertices @v1, @v2, @vmerged
      gnext.has_vertex?( @v1 ).should be_false
      gnext.has_vertex?( @v2 ).should be_false
    end

    it "creates a vertex of the third string" do
      gnext = subject.merge_vertices @v1, @v2, @vmerged
      gnext.has_vertex?( @vmerged ).should be_true
    end

    it "removes the edge connecting the two vertices" do
      gnext = subject.merge_vertices @v1, @v2, @vmerged
      gnext.has_edge?( @e1 ).should be_false
    end

    it "connects the merged vertex with the vertices adjacent to the previous two" do
      gnext = subject.merge_vertices @v1, @v2, @vmerged
      gnext.is_adjacent?( @vmerged, @v3 ).should be_true
      gnext.is_adjacent?( @vmerged, @v4 ).should be_true
      gnext = subject.merge_vertices @v1, @v3, @vmerged
      gnext.is_adjacent?( @vmerged, @v2 ).should be_true
      gnext.is_adjacent?( @vmerged, @v4 ).should be_true
    end

    it "preserves the edges of the first vertex over the second" do
      gnext = subject.merge_vertices @v1, @v3, @vmerged
      gnext.has_edge?( @e1 ).should be_true
      gnext.has_edge?( @e2 ).should be_false
      gnext.has_edge?( @e3 ).should be_false
      gnext.has_edge?( @e4 ).should be_true
    end

  end

  shared_examples "merge_vertices!(String,String,String)" do

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
      subject.add_vertex @v1
      subject.add_vertex @v2
      subject.add_vertex @v3
      subject.add_vertex @v4
      subject.add_edge @e1, @v1, @v2
      subject.add_edge @e2, @v2, @v3
      subject.add_edge @e3, @v3, @v4
      subject.add_edge @e4, @v4, @v1
    end

    it "returns an object of type graph" do
      subject.merge_vertices!( @v1, @v2, @vmerged ).should be_an_instance_of(Graph)
    end

    it "modifies the original graph" do
      subject.merge_vertices! @v1, @v2, @vmerged
      subject.has_vertex?( @v1 ).should be_false
      subject.has_vertex?( @v2 ).should be_false
    end

    it "removes the first two vertices" do
      subject.merge_vertices! @v1, @v2, @vmerged
      subject.has_vertex?( @v1 ).should be_false
      subject.has_vertex?( @v2 ).should be_false
    end

    it "creates a vertex of the third string" do
      subject.merge_vertices! @v1, @v2, @vmerged
      subject.has_vertex?( @vmerged ).should be_true
    end

    it "removes the edge connecting the two vertices" do
      subject.merge_vertices! @v1, @v2, @vmerged
      subject.has_edge?( @e1 ).should be_false
    end

    it "connects the merged vertex with the vertices adjacent to the previous two" do
      subject.merge_vertices! @v1, @v3, @vmerged
      subject.is_adjacent?( @vmerged, @v2 ).should be_true
      subject.is_adjacent?( @vmerged, @v4 ).should be_true
    end

    it "preserves the edges of the first vertex over the second" do
      subject.merge_vertices! @v1, @v3, @vmerged
      subject.has_edge?( @e1 ).should be_true
      subject.has_edge?( @e2 ).should be_false
      subject.has_edge?( @e3 ).should be_false
      subject.has_edge?( @e4 ).should be_true
    end

  end

  shared_examples "merge_vertices(Array,String)" do

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
      subject.add_vertex @v1
      subject.add_vertex @v2
      subject.add_vertex @v3
      subject.add_vertex @v4
      subject.add_edge @e1, @v1, @v2
      subject.add_edge @e2, @v2, @v3
      subject.add_edge @e3, @v3, @v4
      subject.add_edge @e4, @v4, @v1
    end

    it "deletes the vertices in the array" do
      arr = [ @v1, @v2 ]
      gnext = subject.merge_vertices( arr, @vmerged )
      arr.each do |v|
        gnext.has_vertex?( v ).should be_false
      end
    end

    it "removes the edges connecting the vertices in the array" do
      arrV = [ @v1, @v2, @v3 ]
      arrE = [ @e1, @e2 ]
      gnext = subject.merge_vertices( arrV, @vmerged )
      arrE.each do |e|
        gnext.has_edge?( e ).should be_false
      end
    end

    it "connects the merged vertex with the vertices in the array" do
      arr = [ @v1, @v3 ]
      gnext = subject.merge_vertices( arr, @vmerged )
      [ @v2, @v4 ].each do |v|
        gnext.is_adjacent?( @vmerged, v ).should be_true
      end
    end

    it "preserves the edges of earlier vertices than later" do
      arr = [ @v1, @v3 ]
      gnext = subject.merge_vertices( arr, @vmerged )
      gnext.has_edge?( @e1 ).should be_true
      gnext.has_edge?( @e2 ).should be_false
      gnext.has_edge?( @e3 ).should be_false
      gnext.has_edge?( @e4 ).should be_true
    end

  end

  shared_examples "merge_vertices!(Array,String)" do

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
      subject.add_vertex @v1
      subject.add_vertex @v2
      subject.add_vertex @v3
      subject.add_vertex @v4
      subject.add_edge @e1, @v1, @v2
      subject.add_edge @e2, @v2, @v3
      subject.add_edge @e3, @v3, @v4
      subject.add_edge @e4, @v4, @v1
    end

    it "deletes the vertices in the array" do
      arr = [ @v1, @v2 ]
      subject.merge_vertices!( arr, @vmerged )
      arr.each do |v|
        subject.has_vertex?( v ).should be_false
      end
    end

    it "removes the edges connecting the vertices in the array" do
      arrV = [ @v1, @v2, @v3 ]
      arrE = [ @e1, @e2 ]
      subject.merge_vertices!( arrV, @vmerged )
      arrE.each do |e|
        subject.has_edge?( e ).should be_false
      end
    end

    it "connects the merged vertex with the vertices in the array" do
      arr = [ @v1, @v3 ]
      subject.merge_vertices!( arr, @vmerged )
      [ @v2, @v4 ].each do |v|
        subject.is_adjacent?( @vmerged, v ).should be_true
      end
    end

    it "preserves the edges of earlier vertices than later" do
      arr = [ @v1, @v3 ]
      subject.merge_vertices!( arr, @vmerged )
      subject.has_edge?( @e1 ).should be_true
      subject.has_edge?( @e2 ).should be_false
      subject.has_edge?( @e3 ).should be_false
      subject.has_edge?( @e4 ).should be_true
    end

  end

end
