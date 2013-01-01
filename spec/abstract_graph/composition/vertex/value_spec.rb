require 'spec_helper'

module AbstractGraph
  module Composition
    describe Vertex do

      describe "#value" do

        before (:each) do
          @arbitraryString = "arbitraryString"
          @arbitraryObject = Object.new
        end

        it "equals the object passed in #new(String, Object)" do
          vertex = Vertex.new(@arbitraryString, @arbitraryObject)
          vertex.value.should eql(@arbitraryObject)
        end

        it "equals to nil if nothing was passed as second param" do
          vertex = Vertex.new()
          vertex.value.should be_nil
        end

      end

      describe "#value=" do

        before (:each) do
          @vertex = Vertex.new()
        end

        it "allows us to change the value of the vertex" do
          @vertex.value = 2
          @vertex.value.should eql(2)
        end

        it "allows us to create two vertices of the same object" do
          @vertex.value = "Hello"
          @vertex2 = Vertex.new("v2", "Hello")
          @vertex.value.should eql(@vertex2.value)
        end

      end
    end
  end
end
