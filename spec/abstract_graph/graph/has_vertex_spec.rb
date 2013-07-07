require 'spec_helper'

module AbstractGraph
  describe Graph do

    before :each do
      @graph = Graph.new
    end

    describe "#has_vertex?(String)" do

      it "returns whether the string name is a named vertex in the graph" do
        @graph.add_vertex "MyVertex"
        @graph.has_vertex?( "MyVertex" ).should be_true
      end

      it "returns false when the string is not a named vertex" do
        @graph.has_vertex?( "MyVertex" ).should be_false
        @graph.has_vertex?( "AlsoFalse" ).should_not be_nil
      end

    end

  end
end
