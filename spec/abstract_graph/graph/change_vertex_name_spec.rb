require 'spec_helper'

module AbstractGraph
  describe Graph do

    before :all do
      @vertex = "MyVertex"
      @vertexchanged = "MyChangedName"
    end

    before :each do
      @graph = Graph.new
      @graph.add_vertex @vertex
    end

    describe "#change_vertex_name(String,String)" do

      it "returns an object of class Graph" do
        @graph.change_vertex_name( @vertex, @vertexchanged ).should be_an_instance_of(Graph)
      end

      it "changes the name of the vertex" do
        @graph.change_vertex_name( @vertex, @vertexchanged )
        @graph.has_vertex?( @vertex ).should be_false
        @graph.has_vertex?( @vertexchanged ).should be_true
      end

      it "returns nil if the vertex does not exist" do
        @graph.change_vertex_name( @vertexchanged, @vertex ).should be_nil
      end

      it "throws an exception if the name has already been taken" do
        @graph.add_vertex @vertexchanged
        expect { @graph.change_vertex_name( @vertex, @vertexchanged ) }.to raise_error
      end

    end

  end
end
