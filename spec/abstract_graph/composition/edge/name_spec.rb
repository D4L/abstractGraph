require 'spec_helper'

module AbstractGraph
  module Composition
    describe Edge do

      before :all do
        @v1 = Vertex.new "v1"
        @v2 = Vertex.new "v2"
      end

      describe "#name" do

        before :each do
          @arbitraryString = "arbitraryString"
          @edge = Edge.new @arbitraryString, @v1, @v2
        end

        it "returns a String (Always)" do
          @edge.name.should be_an_instance_of(String)
        end

        it "equals to the String in #new(String)" do
          @edge.name.should eql(@arbitraryString)
        end

        it "equals to empty string if no string was passed in" do
          edge1 = Edge.new @v1, @v2
          edge1.name.should eql("")
        end

      end

      describe "#name=" do

        before :each do
          @edge = Edge.new @v1, @v2
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
  end
end
