require 'spec_helper'

module AbstractGraph
  describe Graph do

    before :each do
      @graph = Graph.new
    end

    describe "#add_vertex(String)" do

      it "returns an object of class Graph" do
        @graph.add_vertex( "MyVertex" ).should be_an_instance_of(Graph)
      end

      it "throws an exception when adding vertex of existing name" do
        @graph.add_vertex( "MyVertex" )
        expect { @graph.add_vertex( "MyVertex" ) }.to raise_error
      end

      it "allows two different graphs to have the same names" do
        graph2 = Graph.new
        @graph.add_vertex( "MyVertex" )
        expect { graph2.add_vertex( "MyVertex" ) }.to_not raise_error
      end

    end
  end
end
