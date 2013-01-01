require 'spec_helper'

module AbstractGraph
  module Composition
    describe Vertex do

      describe "#name" do

        before (:each) do
          @arbitraryString = "abitraryString"
          @vertex = Vertex.new(@arbitraryString)
        end

        it "returns a String (Always)" do
          @vertex.name.should be_an_instance_of(String)
        end

        it "equals to the String in #new(String)" do
          @vertex.name.should eql(@arbitraryString)
        end

        it "equals to \"\" if nothing was passed as first param" do
          @vertex2 = Vertex.new()
          @vertex2.name.should eql("")
        end

      end

      describe "#name=" do

        before (:each) do
          @vertex = Vertex.new()
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
  end
end
