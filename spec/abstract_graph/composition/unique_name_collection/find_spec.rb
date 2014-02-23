require 'spec_helper'

module AbstractGraph
  module Composition
    describe UniqueNameCollection do

      before(:each) do
        @collection = UniqueNameCollection.new
        @dummy = Dummy.new
        @name = "DummyName"
        @dummy.name = @name
        @collection.add(@dummy)
      end

      describe "#find(name)" do

        it "returns an object of the right class" do
          @collection.find(@name).should be_an_instance_of(Dummy)
        end

        it "should return the correct object" do
          @collection.find(@name).should eql(@dummy)
        end

        it "should return nil if a name that doesn't exist is passed" do
          @collection.find("BadName").should be_nil
        end

      end

    end
  end
end
