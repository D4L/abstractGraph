require 'spec_helper'

describe AbstractGraph::Composition::Edge do
  
  describe "#name" do

    before :each do
      @arbitraryString = "arbitraryString"
      @edge = AbstractGraph::Composition::Edge.new @arbitraryString
    end
     
    it "returns a String (Always)" do
      @edge.name.should be_an_instance_of(String)
    end

    it "equals to the String in #new(String)" do
      @edge.name.should eql(@arbitraryString)
    end

  end

  describe "#name=" do

    before :each do
      @edge = AbstractGraph::Composition::Edge.new
    end

    it "names the edge and retrieved by #name" do
      @edge.name = "Hello World"
      @edge.name.should eql("Hello World")
    end

    it "doesn't allow a non-String input" do
      expect { @edge.name = 100 }.to raise_error
    end

  end

end
