require 'spec_helper'

module AbstractGraph

  shared_examples "split_vertex(String)" do |implementation|

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
      @g5path = Graph.path_graph 5, implementation: implementation
      subject.add_vertex @v1
      subject.add_vertex @v2
      subject.add_vertex @v3
      subject.add_vertex @v4
      subject.add_edge   @e1, @v1, @v2
      subject.add_edge   @e2, @v2, @v3
      subject.add_edge   @e3, @v3, @v4
      subject.add_edge   @e4, @v4, @v2
    end

    it "returns an object of type graph" do
      subject.split_vertex(@v1).should be_an_instance_of(Graph)
    end

    it "does not modify the original graph" do
      subject.split_vertex(@v1)
      subject.has_vertex?( @v1 ).should be_true
      subject.has_vertex?( @v2 ).should be_true
      subject.has_edge?( @e1 ).should be_true
      subject.has_vertex?( @vsplit1 ).should be_false
      subject.has_vertex?( @vsplit2 ).should be_false
      subject.has_edge?( @esplit1 ).should be_false
    end

    it "removes the original vertex and adjacent edges" do
      gnext = subject.split_vertex @v1
      gnext.has_vertex?( @v1 ).should be_false
      gnext.has_edge?( @e1 ).should be_false

      gnext = @g5path.split_vertex "v4"
      gnext.has_vertex?("v4").should be_false
      gnext.has_vertex?( "e6" ).should be_false
      gnext.has_vertex?( "e12" ).should be_false
    end

    it "adds split versions of the original vertex and adjacent edges" do
      gnext = subject.split_vertex @v1
      gnext.has_vertex?( @vsplit1 ).should be_true
      gnext.has_vertex?( @vsplit2 ).should be_true
      gnext.has_edge?( @esplit1 ).should be_true
      gnext.has_edge?( @esplit2 ).should be_true

      gnext = @g5path.split_vertex "v4"
      gnext.has_vertex?( "v4-1" ).should be_true
      gnext.has_vertex?( "v4-2" ).should be_true
      gnext.has_edge?( "e6-1" ).should be_true
      gnext.has_edge?( "e6-2" ).should be_true
      gnext.has_edge?( "e12-1" ).should be_true
      gnext.has_edge?( "e12-2" ).should be_true
    end

    it "connects the split vertices with previous adjacent vertices" do
      gnext = subject.split_vertex @v1
      gnext.is_adjacent?( @vsplit1, @v2 ).should be_true
      gnext.is_adjacent?( @vsplit2, @v2 ).should be_true

      gnext = @g5path.split_vertex "v4"
      gnext.is_adjacent?( "v4-1", "v2" ).should be_true
      gnext.is_adjacent?( "v4-2", "v2" ).should be_true
      gnext.is_adjacent?( "v4-1", "v8" ).should be_true
      gnext.is_adjacent?( "v4-2", "v8" ).should be_true
    end

    it "can be chained to create very elaborate graphs very fast" do
      gnext = @g5path.split_vertex("v2").split_vertex("v4")
      gnext.is_adjacent?( "v2-1", "v1" ).should be_true
      gnext.is_adjacent?( "v2-2", "v1" ).should be_true
      gnext.is_adjacent?( "v4-1", "v8" ).should be_true
      gnext.is_adjacent?( "v4-2", "v8" ).should be_true
      gnext.is_adjacent?( "v4-1", "v2-1" ).should be_true
      gnext.is_adjacent?( "v4-2", "v2-1" ).should be_true
      gnext.is_adjacent?( "v4-1", "v2-2" ).should be_true
      gnext.is_adjacent?( "v4-2", "v2-2" ).should be_true
    end

  end

end
