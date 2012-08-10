require 'spec_helper'

describe AbstractGraph::Composition::Vertex do
  describe "#name" do

    before (:each) do
      @arbitraryString = "abitraryString"
      @vertex = AbstractGraph::Composition::Vertex.new(@arbitraryString)
    end

    it "returns a String (Always)" do
      @vertex.name.should be_an_instance_of(String)
    end

    it "equals to the String in #new(String)" do
      @vertex.name.should eql(@arbitraryString)
    end

  end

  describe "#name=" do

    before (:each) do
      @vertex = AbstractGraph::Composition::Vertex.new()
    end

    it "names the vertex and retrieved by #name" do
      @vertex.name = "Hello World"
      @vertex.name.should eql("Hello World")
    end

    it "doesn't allow a non-String input" do
      expect { @vertex.name = 100 }.to raise_error
    end

  end
end
