require 'spec_helper'

module AbstractGraph
  describe Graph do

    before :all do
    end

    before :each do
    end

    describe "#connected?" do

      it "returns true for any path" do
        Graph.path_graph( 3 ).connected?.should be_true
        Graph.path_graph( 1 ).connected?.should be_true
        Graph.path_graph( 10 ).connected?.should be_true
      end

      it "returns true for an empty graph" do
        Graph.new.connected?.should be_true
      end

      it "returns true for any cycle" do
        Graph.cycle_graph( 3 ).connected?.should be_true
        Graph.cycle_graph( 5 ).connected?.should be_true
      end

      it "returns false after a path loses an edge" do
        graph3path = Graph.path_graph(3)
        graph3path.connected?.should be_true
        graph3path.delete_edge! "e3"
        graph3path.connected?.should be_false
      end

    end

  end
end
