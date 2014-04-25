require 'spec_helper'

module AbstractGraph

  shared_examples "connected?" do |implementation|

    it "returns true for any path" do
      Graph.path_graph( 3, implementation: implementation ).connected?.should be_true
      Graph.path_graph( 1, implementation: implementation ).connected?.should be_true
      Graph.path_graph( 10, implementation: implementation ).connected?.should be_true
    end

    it "returns true for an empty graph" do
      Graph.new( implementation: implementation ).connected?.should be_true
    end

    it "returns true for any cycle" do
      Graph.cycle_graph( 3, implementation: implementation ).connected?.should be_true
      Graph.cycle_graph( 5, implementation: implementation ).connected?.should be_true
    end

    it "returns false after a path loses an edge" do
      graph3path = Graph.path_graph( 3, implementation: implementation )
      graph3path.connected?.should be_true
      graph3path.delete_edge! "e3"
      graph3path.connected?.should be_false
    end

  end

end
