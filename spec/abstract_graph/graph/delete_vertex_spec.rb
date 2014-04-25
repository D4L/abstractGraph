require 'spec_helper'

module AbstractGraph

  shared_examples "delete_vertex(String)" do

    before :each do
      subject.add_vertex "MyVertex"
    end

    it "returns an object of class Graph" do
      subject.delete_vertex( "MyVertex" ).should be_an_instance_of(Graph)
    end

    it "returns an object without the vertex" do
      nextGraph = subject.delete_vertex( "MyVertex" )
      nextGraph.has_vertex?( "MyVertex" ).should be_false
    end

    it "does not modify the original graph" do
      subject.delete_vertex( "MyVertex" )
      subject.has_vertex?( "MyVertex" ).should be_true
    end

  end

  shared_examples "delete_vertex!(String)" do

    before :each do
      subject.add_vertex "MyVertex"
    end

    it "returns an object of class Graph" do
      subject.delete_vertex!( "MyVertex" ).should be_an_instance_of(Graph)
    end

    it "returns an object without the vertex" do
      nextGraph = subject.delete_vertex!( "MyVertex" )
      nextGraph.has_vertex?( "MyVertex" ).should be_false
    end

    it "removes the vertex from the original graph" do
      subject.delete_vertex!( "MyVertex" )
      subject.has_vertex?( "MyVertex" ).should be_false
    end

  end

end
