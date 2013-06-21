require 'spec_helper'

module AbstractGraph
  describe Graph do

    describe ".complete_bipartite_graph(Integer,Integer)" do

      before :all do
        @n, @m = 5, 6
        @graphknm = Graph.complete_bipartite_graph @n, @m
        @graphk1010 = Graph.complete_bipartite_graph 10, 10
      end

      it "returns an object of class Graph" do
        Graph.complete_bipartite_graph(1, 1).should be_an_instance_of(Graph)
      end

      it "creates as many vertices as the sum of the Integers, named with powers of two" do
        (@n + @m).times do |i|
          @graphknm.has_vertex?("v#{2**i}").should be_true
        end
        @graphk1010.has_vertex?("v#{2**19}").should be_true
      end

      it "ensures the first Integer vertices have second Integer degree" do
        (@n).times do |i|
          @graphknm.adjacency_list("v#{2**i}").size.should eql(@m)
        end
      end

      it "ensures the second Integer vertices are vertices (First Integer..Second Integer - 1) and have first integer degree" do
        (@m).times do |i|
          @graphknm.adjacency_list("v#{2**(i+@n)}").size.should eql(@n)
        end
      end

      it "creates as many edges as the product of the Integers" do
        adjacencies = 0
        (@n + @m).times do |i|
          adjacencies += @graphknm.adjacency_list("v#{2**i}").size
        end
        adjacencies.should eql(@n*@m*2)
      end

      it "contains the proper edges" do
        nVertices = @n.times {|i| 2**i}
        mVertices = @m.times {|i| 2**(i+@n)}
        edges = []
        nVertices.each do |n|
          mVertices.each do |m|
            edges << n + m
          end
        end
        edges.each do |e|
          @graphknm.has_edge?("e#{e}").should be_true
        end

      end

    end

  end
end
