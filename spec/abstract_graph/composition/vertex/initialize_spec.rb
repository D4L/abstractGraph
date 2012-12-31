require 'spec_helper'

module AbstractGraph
  module Composition
    describe Vertex do

      before :each do
        Vertex.class_variable_set :@@names, []
      end

      describe "#new" do

        before (:each) do
          @vertex = Vertex.new
        end

        it "returns an object of class Vertex" do
          @vertex.should be_an_instance_of(Vertex)
        end

      end

      describe "#new(String)" do

        before (:each) do
          @vertex = Vertex.new("v1")
        end

        it "allows vertices to be initiated with a string name" do
          @vertex.should_not be_nil
        end

      end

      describe "#new(String, Object)" do

        before (:each) do
          @vertex = Vertex.new("v1", "Hello")
        end

        it "allows vertices to be initiated with name and value" do
          @vertex.should_not be_nil
        end

      end

    end
  end
end
