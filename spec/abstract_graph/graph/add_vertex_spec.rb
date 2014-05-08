require 'spec_helper'

module AbstractGraph

  shared_examples "add_vertex(String)" do |implementation|

    it "returns an object of class Graph" do
      subject.add_vertex( "MyVertex" ).should be_an_instance_of(Graph)
    end

    it "throws an exception when adding vertex of existing name" do
      subject.add_vertex( "MyVertex" )
      expect { subject.add_vertex( "MyVertex" ) }.to raise_error
    end

    it "allows two different graphs to have the same names" do
      graph2 = Graph.new implementation: implementation
      subject.add_vertex( "MyVertex" )
      expect { graph2.add_vertex( "MyVertex" ) }.to_not raise_error
    end

  end
end
