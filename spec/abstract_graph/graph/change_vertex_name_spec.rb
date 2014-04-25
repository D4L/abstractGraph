require 'spec_helper'

module AbstractGraph

  shared_examples "change_vertex_name(String,String)" do

    before :all do
      @vertex = "MyVertex"
      @vertexchanged = "MyChangedName"
    end

    before :each do
      subject.add_vertex @vertex
    end

    it "returns an object of class Graph" do
      subject.change_vertex_name( @vertex, @vertexchanged ).should be_an_instance_of(Graph)
    end

    it "changes the name of the vertex" do
      subject.change_vertex_name( @vertex, @vertexchanged )
      subject.has_vertex?( @vertex ).should be_false
      subject.has_vertex?( @vertexchanged ).should be_true
    end

    it "returns nil if the vertex does not exist" do
      subject.change_vertex_name( @vertexchanged, @vertex ).should be_nil
    end

    it "throws an exception if the name has already been taken" do
      subject.add_vertex @vertexchanged
      expect { subject.change_vertex_name( @vertex, @vertexchanged ) }.to raise_error
    end

  end

end
