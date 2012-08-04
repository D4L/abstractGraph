require 'spec_helper'

describe "Graph" do
    describe "initialize" do
        it "returns an object of class Graph" do
            Graph.new.class.should == Graph
        end
    end
end
