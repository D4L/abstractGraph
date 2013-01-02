require 'spec_helper'

module AbstractGraph
  module Composition
    describe UniqueNameCollection do

      before :each do
        @collection = UniqueNameCollection.new
      end

      describe "#dup" do

        it "doesn't have the same id as the original" do
          @collection.object_id.should_not == @collection.dup.object_id
        end

        it "creates a duplicate of every item in the collection" do
          secondCollection = @collection.dup
          dummy = Dummy.new
          dummy.name = "Dummy"
          @collection.add dummy
          secondCollection.collection.size.should == 0
        end

      end

    end
  end
end
