require 'spec_helper'

module AbstractGraph
  describe Graph do

    describe ".petersen_graph" do

      before :all do
        @graphpetersen = Graph.petersen_graph
      end

      it "returns an object of class Graph" do
        @graphpetersen.should be_an_instance_of(Graph)
      end

      it "contains 10 vertices and 15 edges" do
        adjacencies = 0
        (0..9).each do |i|
          @graphpetersen.has_vertex?("v#{2**i}").should be_true
          adjacencies += @graphpetersen.adjacency_list("v#{2**i}").size
        end
        adjacencies.should eql(15 * 2)
      end

      it "ensures each vertex has degree 3" do
        (0..9).each do |i|
          @graphpetersen.adjacency_list("v#{2**i}").size.should eql(3)
        end
      end

    end

  end
end
