require 'spec_helper'

describe AbstractGraph::Composition::Vertex do

  before :each do
    AbstractGraph::Composition::Vertex.class_variable_set :@@names, []
  end

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

    it "equals to \"\" if nothing was passed as first param" do
      @vertex2 = AbstractGraph::Composition::Vertex.new()
      @vertex2.name.should eql("")
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

    it "doesn't allow two objects to have the same name" do
      @vertex.name = "v1"
      vertex2 = AbstractGraph::Composition::Vertex.new("v2")
      expect { vertex2.name = "v1" }.to raise_error
    end

    it "can change a name of a vertex to free up the name" do
      @vertex.name = "v1"
      begin
        vertex2 = AbstractGraph::Composition::Vertex.new()
      rescue Exception => e
        fail
      end
    end

    it "can reuse a name after delete removes it" do
      @vertex.name = "v1"
      @vertex.delete
      begin
        vertex2 = AbstractGraph::Composition::Vertex.new("v1")
      rescue Exception => e
        fail
      end
    end

  end
end
