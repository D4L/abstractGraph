require 'spec_helper'

module AbstractGraph
  module Composition
    describe Vertex do

      before :each do
        Vertex.class_variable_set :@@names, []
      end

      describe "#delete" do

        it "removes the name of the vertex in the namespace" do
          vertex = Vertex.new("v1")
          vertex.delete
          Vertex.class_variable_get(:@@names).should eql([])
        end

      end
    end
  end
end
