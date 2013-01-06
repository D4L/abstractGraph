require 'spec_helper'

module AbstractGraph
  describe Graph do

    before :each do
      @graph = Graph.new
      @graph.add_vertex "MyVertex"
    end

    describe "#delete_vertex(String)" do

      it "returns an object of class Graph" do
        @graph.delete_vertex( "MyVertex" ).should be_an_instance_of(Graph)
      end

      it "returns an object without the vertex" do
        nextGraph = @graph.delete_vertex( "MyVertex" )
        nextGraph.has_vertex?( "MyVertex" ).should be_false
      end

      it "does not modify the original graph" do
        @graph.delete_vertex( "MyVertex" )
        @graph.has_vertex?( "MyVertex" ).should be_true
      end

    end

    describe "#delete_vertex!(String)" do

      it "returns an object of class Graph" do
        @graph.delete_vertex!( "MyVertex" ).should be_an_instance_of(Graph)
      end

      it "returns an object without the vertex" do
        nextGraph = @graph.delete_vertex!( "MyVertex" )
        nextGraph.has_vertex?( "MyVertex" ).should be_false
      end

      it "removes the vertex from the original graph" do
        @graph.delete_vertex!( "MyVertex" )
        @graph.has_vertex?( "MyVertex" ).should be_false
      end

    end

  end
end
