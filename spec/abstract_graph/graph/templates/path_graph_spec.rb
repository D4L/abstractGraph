require 'spec_helper'

module AbstractGraph
  describe Graph do

    describe ".path_graph(Integer)" do

      before :all do
        @n = 4
        @graphnpath = Graph.path_graph @n
        @graph10path = Graph.path_graph 10
      end

      it "returns an object of class Graph" do
        Graph.path_graph(1).should be_an_instance_of(Graph)
      end

      it "creates as many vertices as the integer, named with powers of two" do
        @n.times do |i|
          @graphnpath.has_vertex?("v#{2**i}").should be_true
        end
        @graph10path.has_vertex?("v#{2**9}").should be_true
      end

      it "creates the same number as edges as integer - 1" do
        adjacencies = 0
        @n.times do |i|
          adjacencies += @graphnpath.adjacency_list("v#{2**i}").size
        end
        adjacencies.should eql((@n - 1)*2)
      end

      it "ensures there are two 'end' vertices" do
        endVertices = 0
        @n.times do |i|
          endVertices += 1 if @graphnpath.adjacency_list("v#{2**i}").size == 1
        end
        endVertices.should eql(2)
      end

      it "ensures there are integer - 2 vertices with adjacency two" do
        connectorVertices = 0
        @n.times do |i|
          connectorVertices += 1 if @graphnpath.adjacency_list("v#{2**i}").size == 2
        end
        connectorVertices.should eql(@n - 2)
      end

    end

  end
end
